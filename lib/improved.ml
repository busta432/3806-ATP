(** improved.ml — ENGINE 2: Improved LK' Prover.
    
    Optimizations:
    - Lazy Search Tree: Decouples proof generation from search strategy.
    - Unification-guided Metavariables: Robinson's unification for identities.
    - Fingerprint Indexing: Fast candidate retrieval for axiom checks.
    - Formula Complexity: Prioritizes simpler expansions.
    - Regularity & Failure Caching: Prunes redundant and known-bad branches. *)

open Types
open Formula
open Unification
open Indexing

(* ================================================================ *)
(* METAVARIABLE HANDLING                                             *)
(* ================================================================ *)

let metavar_counter = ref 0
let fresh_metavar () = 
  let n = !metavar_counter in
  incr metavar_counter;
  "?" ^ string_of_int n

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

let find_identity sigma antecedent succedent =
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
              (match unify sigma (List.combine args_a args_s) with
               | Some sigma' -> Some sigma'
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
      let x' = variant x (List.concat_map free_vars (sequent.antecedent @ sequent.succedent)) in
      [{ sequent with succedent = subst [(x, Var x')] body :: (List.filteri (fun j _ -> i <> j) sequent.succedent) }]
  | ExistsLeft (i, _) ->
      let x, body = match List.nth sequent.antecedent i with Exists(x, b) -> x, b | _ -> failwith "ExistsL" in
      let x' = variant x (List.concat_map free_vars (sequent.antecedent @ sequent.succedent)) in
      [{ sequent with antecedent = subst [(x, Var x')] body :: (List.filteri (fun j _ -> i <> j) sequent.antecedent) }]
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
      [{ sequent with antecedent = rest_ant; succedent = a :: sequent.succedent };
       { sequent with antecedent = b :: rest_ant }]
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

let rec mk_node sequent =
  { sequent; expansion = lazy (expand_node sequent) }

and expand_node sequent =
  let l_rules = collect_rules 0 sequent.antecedent in
  let r_rules = collect_right_rules 0 sequent.succedent in
  let all_rules = List.map (fun (r, f) -> (r, formula_complexity f)) (l_rules @ r_rules) in
  (* Heuristic: prioritize simpler formulas *)
  let sorted_rules = List.sort (fun (_, c1) (_, c2) -> compare c1 c2) all_rules in
  List.map (fun (r, _) -> (r, List.map mk_node (apply_rule sequent r))) sorted_rules

(* ================================================================ *)
(* PROOF SEARCH CORE                                                 *)
(* ================================================================ *)

let canonical_hash sigma s =
  let s' = apply_to_sequent sigma s in
  let ant = List.sort compare s'.antecedent in
  let suc = List.sort compare s'.succedent in
  Hashtbl.hash (ant, suc)

let rec search stats depth_limit sigma failed_cache seen_literals node =
  stats.steps <- stats.steps + 1;
  stats.max_depth <- max stats.max_depth (30 - depth_limit);
  
  if depth_limit < 0 then None else
  let h = canonical_hash sigma node.sequent in
  if Hashtbl.mem failed_cache (h, depth_limit) then None else

  (* 1. Axiom Checks *)
  if List.mem Top node.sequent.succedent || List.mem Bot node.sequent.antecedent then
    Some sigma
  else
    match find_identity sigma node.sequent.antecedent node.sequent.succedent with
    | Some sigma' -> Some sigma'
    | None ->
        if depth_limit = 0 then (Hashtbl.add failed_cache (h, depth_limit) (); None) else
        
        (* Regularity: check for literal repetition *)
        let lits = List.filter (fun f -> match f with Pred _ -> true | Not(Pred _) -> true | _ -> false) 
                    (node.sequent.antecedent @ node.sequent.succedent) in
        let norm_lits = List.map (fun f -> Printer.pp_formula (apply_to_formula sigma f)) lits in
        if List.exists (fun l -> List.mem l seen_literals) norm_lits then None else
        let new_seen = seen_literals @ norm_lits in

        (* 2. Expansion *)
        let rec try_expansions = function
          | [] -> (Hashtbl.add failed_cache (h, depth_limit) (); None)
          | (rule, branches) :: rest ->
              let rec try_branches current_sigma = function
                | [] -> Some current_sigma
                | b :: bs ->
                    (match search stats (depth_limit - 1) current_sigma failed_cache new_seen b with
                     | Some sigma' -> try_branches sigma' bs
                     | None -> None)
              in
              match try_branches sigma branches with
              | Some sigma_final -> Some sigma_final
              | None -> try_expansions rest
        in
        try_expansions (Lazy.force node.expansion)

(* ================================================================ *)
(* MAIN ENTRY POINT                                                  *)
(* ================================================================ *)

let prove formula timeout_ms =
  let start_time = Unix.gettimeofday () in
  let stats = make_stats () in
  let root = mk_node { antecedent = []; succedent = [formula] } in
  let failed_cache = Hashtbl.create 1024 in
  
  let rec iterative_deepening limit =
    let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
    if elapsed > timeout_ms || limit > 30 then
      { engine = Improved; solved = false; stats = { stats with time_ms = elapsed } }
    else
      match search stats limit [] failed_cache [] root with
      | Some _ ->
          stats.time_ms <- (Unix.gettimeofday () -. start_time) *. 1000.;
          { engine = Improved; solved = true; stats }
      | None -> iterative_deepening (limit + 1)
  in
  iterative_deepening 1
