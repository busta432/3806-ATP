(** improved.ml — ENGINE 2: Improved LK' Prover. *)

open Types
open Formula
open Unification
open Indexing

(* ================================================================ *)
(* METAVARIABLE HANDLING                                             *)
(* ================================================================ *)

exception Timeout_exn
let metavar_counter = ref 0
let deadline = ref 0.
let fresh_metavar () = 
  let n = !metavar_counter in
  incr metavar_counter;
  "?" ^ string_of_int n

let rec get_mvars_term acc = function
  | Var x when is_metavar x -> x :: acc
  | Var _ -> acc
  | Func (_, args) -> List.fold_left get_mvars_term acc args

let rec get_mvars_formula acc = function
  | Top | Bot -> acc
  | Pred (_, args) -> List.fold_left get_mvars_term acc args
  | Not f -> get_mvars_formula acc f
  | And (f1, f2) | Or (f1, f2) | Implies (f1, f2) | Iff (f1, f2) ->
      get_mvars_formula (get_mvars_formula acc f1) f2
  | Forall (_, f) | Exists (_, f) -> get_mvars_formula acc f

let sequent_metavars s =
  let m1 = List.fold_left get_mvars_formula [] s.antecedent in
  let m2 = List.fold_left get_mvars_formula m1 s.succedent in
  unique m2

let rename_sequent_metavars s mvars =
  let mapping = List.map (fun v -> (v, Var (fresh_metavar ()))) mvars in
  let s' = apply_to_sequent mapping s in
  s', mapping

(* ================================================================ *)
(* FORMULA COMPLEXITY                                               *)
(* ================================================================ *)

let rec term_complexity = function
  | Var _ -> 1
  | Func (_, args) -> 1 + List.fold_left (fun acc t -> acc + term_complexity t) 0 args

let rec formula_complexity = function
  | Top | Bot -> 1
  | Pred (_, args) -> 1 + List.fold_left (fun acc t -> acc + term_complexity t) 0 args
  | Not f -> 1 + formula_complexity f
  | And (f1, f2) | Or (f1, f2) | Implies (f1, f2) | Iff (f1, f2) ->
      1 + formula_complexity f1 + formula_complexity f2
  | Forall (_, f) | Exists (_, f) -> 10 + formula_complexity f

(* ================================================================ *)
(* LAZY SEARCH STRUCTURE                                            *)
(* ================================================================ *)

type search_node = {
  sequent : sequent;
  expansion : (rule * search_node list) list Lazy.t;
}

(* ================================================================ *)
(* AXIOM CHECKING WITH INDEXING                                     *)
(* ================================================================ *)

let find_identity stats sigma antecedent succedent =
  let index = FingerprintIndex.create () in
  let non_atom_ants = ref [] in
  List.iter (function
    | Pred _ as p -> FingerprintIndex.insert index p
    | f -> non_atom_ants := f :: !non_atom_ants) antecedent;
  
  let rec check_succs = function
    | [] -> None
    | (Pred _ as s) :: rest ->
        let candidates = FingerprintIndex.query index s in
        let rec try_unify = function
          | [] -> check_succs rest
          | (Pred (_, args_a)) :: as_rest ->
              let args_s = match s with Pred (_, a) -> a | _ -> [] in
              (match unify ~use_rank_check:true is_metavar sigma (List.combine args_a args_s) with
               | Some sigma' -> 
                   if sigma' <> sigma then stats.inst_hits <- stats.inst_hits + 1;
                   Some sigma'
               | None -> try_unify as_rest)
          | _ :: as_rest -> try_unify as_rest
        in try_unify candidates
    | s :: rest ->
        if List.exists (formula_equal s) !non_atom_ants then Some sigma
        else check_succs rest
  in check_succs succedent

(* ================================================================ *)
(* RULE APPLICATION                                                 *)
(* ================================================================ *)

let rec collect_rules i = function
  | [] -> []
  | f :: fs ->
      let rest = collect_rules (i+1) fs in
      match f with
      | And _ -> (AndLeft i, f) :: rest
      | Or _ -> (OrLeft i, f) :: rest
      | Implies _ -> (ImpliesLeft i, f) :: rest
      | Iff _ -> (IffLeft i, f) :: rest
      | Not _ -> (NotLeft i, f) :: rest
      | Exists (x, _) -> (ExistsLeft (i, x), f) :: rest
      | Forall (x, _) -> (ForallLeft (i, Var x), f) :: rest
      | _ -> rest

let rec collect_right_rules i = function
  | [] -> []
  | f :: fs ->
      let rest = collect_right_rules (i+1) fs in
      match f with
      | And _ -> (AndRight i, f) :: rest
      | Or _ -> (OrRight i, f) :: rest
      | Implies _ -> (ImpliesRight i, f) :: rest
      | Iff _ -> (IffRight i, f) :: rest
      | Not _ -> (NotRight i, f) :: rest
      | Forall (x, _) -> (ForallRight (i, x), f) :: rest
      | Exists (x, _) -> (ExistsRight (i, Var x), f) :: rest
      | _ -> rest

let apply_rule sequent = function
  | AndLeft i ->
      let a, b = match List.nth sequent.antecedent i with And(a,b) -> a,b | _ -> failwith "AndL" in
      [{ sequent with antecedent = a :: b :: (List.filteri (fun j _ -> i <> j) sequent.antecedent) }]
  | OrRight i ->
      let a, b = match List.nth sequent.succedent i with Or(a,b) -> a,b | _ -> failwith "OrR" in
      [{ sequent with succedent = a :: b :: (List.filteri (fun j _ -> i <> j) sequent.succedent) }]
  | ImpliesRight i ->
      let a, b = match List.nth sequent.succedent i with Implies(a,b) -> a,b | _ -> failwith "ImpR" in
      [{ antecedent = a :: sequent.antecedent; succedent = b :: (List.filteri (fun j _ -> i <> j) sequent.succedent) }]
  | NotLeft i ->
      let a = match List.nth sequent.antecedent i with Not a -> a | _ -> failwith "NotL" in
      [{ antecedent = List.filteri (fun j _ -> i <> j) sequent.antecedent; succedent = a :: sequent.succedent }]
  | NotRight i ->
      let a = match List.nth sequent.succedent i with Not a -> a | _ -> failwith "NotR" in
      [{ antecedent = a :: sequent.antecedent; succedent = List.filteri (fun j _ -> i <> j) sequent.succedent }]
  | IffLeft i ->
      let a, b = match List.nth sequent.antecedent i with Iff(a,b) -> a,b | _ -> failwith "IffL" in
      let rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
      [{ sequent with antecedent = Implies(a,b) :: Implies(b,a) :: rest }]
  | ForallRight (i, _) ->
      let x, body = match List.nth sequent.succedent i with Forall(x, b) -> x, b | _ -> failwith "ForallR" in
      let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
      let m_count = !metavar_counter in
      let x' = variant x avoid in
      let ev_name = Printf.sprintf "ev_%d_%s" m_count x' in
      [{ sequent with succedent = subst [(x, Var ev_name)] body :: (List.filteri (fun j _ -> i <> j) sequent.succedent) }]
  | ExistsLeft (i, _) ->
      let x, body = match List.nth sequent.antecedent i with Exists(x, b) -> x, b | _ -> failwith "ExistsL" in
      let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
      let m_count = !metavar_counter in
      let x' = variant x avoid in
      let ev_name = Printf.sprintf "ev_%d_%s" m_count x' in
      [{ sequent with antecedent = subst [(x, Var ev_name)] body :: (List.filteri (fun j _ -> i <> j) sequent.antecedent) }]
  (* Branching *)
  | AndRight i ->
      let a, b = match List.nth sequent.succedent i with And(a,b) -> a,b | _ -> failwith "AndR" in
      let rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
      [{ sequent with succedent = a :: rest }; { sequent with succedent = b :: rest }]
  | OrLeft i ->
      let a, b = match List.nth sequent.antecedent i with Or(a,b) -> a,b | _ -> failwith "OrL" in
      let rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
      [{ sequent with antecedent = a :: rest }; { sequent with antecedent = b :: rest }]
  | ImpliesLeft i ->
      let a, b = match List.nth sequent.antecedent i with Implies(a,b) -> a,b | _ -> failwith "ImpL" in
      let rest_ant = List.filteri (fun j _ -> i <> j) sequent.antecedent in
      [{ antecedent = rest_ant; succedent = a :: sequent.succedent };
       { antecedent = b :: rest_ant; succedent = sequent.succedent }]
  | IffRight i ->
      let a, b = match List.nth sequent.succedent i with Iff(a,b) -> a,b | _ -> failwith "IffR" in
      let rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
      [{ sequent with succedent = Implies(a,b) :: rest }; { sequent with succedent = Implies(b,a) :: rest }]
  (* Instantiation *)
  | ForallLeft (i, _) ->
      let x, body = match List.nth sequent.antecedent i with Forall(x,b) -> x,b | _ -> failwith "ForallL" in
      let m = fresh_metavar () in
      [{ sequent with antecedent = subst [(x, Var m)] body :: (List.filteri (fun j _ -> i <> j) sequent.antecedent @ [Forall(x, body)]) }]
  | ExistsRight (i, _) ->
      let x, body = match List.nth sequent.succedent i with Exists(x,b) -> x,b | _ -> failwith "ExistsR" in
      let m = fresh_metavar () in
      [{ sequent with succedent = subst [(x, Var m)] body :: (List.filteri (fun j _ -> i <> j) sequent.succedent @ [Exists(x, body)]) }]
  | _ -> []

(* ================================================================ *)
(* TREE GENERATION                                                  *)
(* ================================================================ *)

let get_rule_tier = function
  | AndLeft _ | OrRight _ | ImpliesRight _ | NotLeft _ | NotRight _ | IffLeft _ -> 1 (* Invertible *)
  | ForallRight _ | ExistsLeft _ -> 2 (* Eigenvariable *)
  | AndRight _ | OrLeft _ | ImpliesLeft _ | IffRight _ -> 3 (* Branching *)
  | ForallLeft _ | ExistsRight _ -> 4 (* Instantiation *)
  | _ -> 5

let rec mk_node sequent =
  { sequent; expansion = lazy (expand_node sequent) }

and expand_node sequent =
  let l_rules = collect_rules 0 sequent.antecedent in
  let r_rules = collect_right_rules 0 sequent.succedent in
  let all_rules = List.map (fun (r, f) -> 
    (r, f, get_rule_tier r, formula_complexity f)
  ) (l_rules @ r_rules) in
  
  let sorted_rules = List.sort (fun (_, _, t1, c1) (_, _, t2, c2) ->
    if t1 <> t2 then compare t1 t2 else compare c1 c2
  ) all_rules in
  
  match sorted_rules with
  | [] -> []
  | (r, _, tier, _) :: _ ->
      if tier <= 2 then
        [(r, List.map mk_node (apply_rule sequent r))]
      else
        List.map (fun (r, _, _, _) -> (r, List.map mk_node (apply_rule sequent r))) sorted_rules

(* ================================================================ *)
(* PROOF SEARCH CORE                                                 *)
(* ================================================================ *)

let canonical_hash sigma s =
  let s' = apply_to_sequent sigma s in
  let ant = List.sort compare s'.antecedent in
  let suc = List.sort compare s'.succedent in
  Hashtbl.hash (ant, suc)

let rec search (stats : prover_stats) proof_limit inst_limit sigma failed_cache current_depth node =
  stats.steps <- stats.steps + 1;
  stats.max_depth <- max current_depth stats.max_depth;
  if stats.steps mod 1000 = 0 && Unix.gettimeofday () > !deadline then None else

  if proof_limit < 0 || inst_limit < 0 then None else
  let h = canonical_hash sigma node.sequent in
  if Hashtbl.mem failed_cache (h, proof_limit, inst_limit) then None else

  (* 1. Axiom Checks *)
  if List.mem Top node.sequent.succedent || List.mem Bot node.sequent.antecedent then
    Some sigma
  else
    match find_identity stats sigma node.sequent.antecedent node.sequent.succedent with
    | Some sigma' -> Some sigma'
    | None ->
        if proof_limit = 0 then (Hashtbl.add failed_cache (h, proof_limit, inst_limit) (); None) else
        
        (* 2. Expansion *)
        let rec try_expansions = function
          | [] -> (Hashtbl.add failed_cache (h, proof_limit, inst_limit) (); None)
          | (rule, branches) :: rest ->
              let next_inst = match rule with ForallLeft _ | ExistsRight _ -> inst_limit - 1 | _ -> inst_limit in
              if next_inst < inst_limit then stats.inst_attempts <- stats.inst_attempts + 1;
              
              if List.length branches > 1 then
                (* Branch-copying (Fix 1) *)
                let mvars = sequent_metavars node.sequent in
                let renamed_branches = List.map (fun b ->
                  let s', map = rename_sequent_metavars b.sequent mvars in
                  { b with sequent = s' }, map
                ) branches in
                
                let rec solve_and_unify current_sigma acc_results = function
                  | [] ->
                      let rec unify_origins s_final = function
                        | [] -> Some s_final
                        | m :: ms ->
                            let values = List.map (fun (sigma_i, map) ->
                              apply sigma_i (List.assoc m map)
                            ) acc_results in
                            (match values with
                             | [] | [_] -> unify_origins s_final ms
                             | v1 :: rest_vs ->
                                 let rec unify_list s acc = function
                                   | [] -> Some s
                                   | v :: vs ->
                                       (match unify ~use_rank_check:true is_metavar s [(acc, v)] with
                                        | Some s' -> unify_list s' v vs
                                        | None -> None)
                                 in
                                 (match unify_list s_final v1 rest_vs with
                                  | Some s' -> unify_origins s' ms
                                  | None -> None))
                      in
                      let merged_sigma = List.fold_left (fun acc (s_i, _) -> compose acc s_i) current_sigma acc_results in
                      unify_origins merged_sigma mvars
                  | (b, map) :: bs ->
                      (match search stats (proof_limit - 1) next_inst current_sigma failed_cache (current_depth + 1) b with
                       | Some sigma_i -> solve_and_unify current_sigma ((sigma_i, map) :: acc_results) bs
                       | None -> None)
                in
                (match solve_and_unify sigma [] renamed_branches with
                 | Some sigma_final -> Some sigma_final
                 | None -> try_expansions rest)
              else
                let rec try_branches current_sigma = function
                  | [] -> Some current_sigma
                  | b :: bs ->
                      (match search stats (proof_limit - 1) next_inst current_sigma failed_cache (current_depth + 1) b with
                       | Some sigma' -> try_branches sigma' bs
                       | None -> None)
                in
                (match try_branches sigma branches with
                 | Some sigma_final -> Some sigma_final
                 | None -> try_expansions rest)
        in
        try_expansions (Lazy.force node.expansion)

(* ================================================================ *)
(* MAIN ENTRY POINT                                                  *)
(* ================================================================ *)

let prove formula timeout_ms =
  metavar_counter := 0;
  let start_time = Unix.gettimeofday () in
  deadline := start_time +. timeout_ms /. 1000.;
  let stats = make_stats () in
  let root = mk_node { antecedent = []; succedent = [formula] } in
  let failed_cache = Hashtbl.create 1024 in
  let secs = max 1 (int_of_float (ceil (timeout_ms /. 1000.))) in
  let old_handler = Sys.signal Sys.sigalrm
    (Sys.Signal_handle (fun _ -> raise Timeout_exn)) in
  let _ = Unix.alarm secs in
  let result =
    try
      let rec iterative_deepening inst_limit =
        let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
        if elapsed > timeout_ms || inst_limit > 10 then
          { engine = Improved; solved = false; stats = { stats with time_ms = elapsed } }
        else
          match search stats 500 inst_limit [] failed_cache 0 root with
          | Some _ ->
              stats.time_ms <- (Unix.gettimeofday () -. start_time) *. 1000.;
              { engine = Improved; solved = true; stats }
          | None -> iterative_deepening (inst_limit + 1)
      in
      iterative_deepening 0
    with Timeout_exn ->
      let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
      { engine = Improved; solved = false; stats = { stats with time_ms = elapsed } }
  in
  let _ = Unix.alarm 0 in
  Sys.set_signal Sys.sigalrm old_handler;
  result
