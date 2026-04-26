(** baseline.ml — ENGINE 1: Baseline LK' Backward Search (Algorithm 2).
    
    Faithful implementation of Algorithm 2 from Zhe Hou's textbook.
    Performs a goal-directed backward search in the LK' sequent calculus.
    To handle quantifiers naively but completely, it uses a depth-limited
    search with a growing Herbrand universe.
    
    Reference:
    - Hou (2021), Fundamentals of Logic and Computation, p. 67. *)

open Types
open Formula

(* ================================================================ *)
(* HERBRAND UNIVERSE ENUMERATION                                     *)
(* ================================================================ *)

(** Generate all terms up to a certain depth using the given 
    function symbols (pairs of name, arity). *)
let rec enumerate_terms functions max_depth =
  if max_depth < 0 then []
  else if max_depth = 0 then
    (* Constants only *)
    let constants = List.filter (fun (_, arity) -> arity = 0) functions in
    List.map (fun (name, _) -> Func (name, [])) constants
  else
    let smaller_terms = enumerate_terms functions (max_depth - 1) in
    let new_terms = 
      List.concat_map (fun (name, arity) ->
        if arity = 0 then [Func (name, [])]
        else
          let rec n_ary_product n =
            if n = 0 then [[]]
            else
              let tails = n_ary_product (n - 1) in
              List.concat_map (fun head ->
                List.map (fun tail -> head :: tail) tails
              ) smaller_terms
          in
          List.map (fun args -> Func (name, args)) (n_ary_product arity)
      ) functions
    in
    unique (smaller_terms @ new_terms)

(** Get all function symbols from a sequent. 
    If none, add a default constant "c". *)
let functions_of_sequent { antecedent; succedent } =
  let forms = antecedent @ succedent in
  let all_fs = List.concat_map functions_of forms in
  let all_v_consts = List.concat_map (fun f -> List.map (fun v -> (v, 0)) (free_vars f)) forms in
  let unique_fs = unique (all_fs @ all_v_consts) in
  if List.exists (fun (_, arity) -> arity = 0) unique_fs then unique_fs
  else ("c", 0) :: unique_fs

(* ================================================================ *)
(* PROOF SEARCH CORE                                                 *)
(* ================================================================ *)

let is_identity { antecedent; succedent } =
  List.exists (fun a -> List.exists (fun s -> formula_equal a s) succedent) antecedent

(** Main search function.
    Strictly prioritized based on the if-else chain in Algorithm 2.
    [used] tracks (formula, term) pairs already instantiated on this branch. *)
let rec search (stats : prover_stats) max_depth term_limit used sequent =
  stats.steps <- stats.steps + 1;
  stats.max_depth <- max (20 - max_depth) stats.max_depth;

  (* 1. Tier 1: Axiom check *)
  if is_identity sequent then Some (Axiom (Identity, sequent))
  else if List.mem Top sequent.succedent then Some (Axiom (TopRight, sequent))
  else if List.mem Bot sequent.antecedent then Some (Axiom (BotLeft, sequent))
  else if max_depth <= 0 then None
  else
    (* 2. Tier 2: Non-branching propositional and eigenvariable rules *)
    match find_tier2_rule sequent with
    | Some rule -> apply_rule stats (max_depth - 1) term_limit used sequent rule
    | None ->
    (* 3. Tier 3: Branching propositional rules *)
    match find_tier3_rule sequent with
    | Some rule -> apply_rule stats (max_depth - 1) term_limit used sequent rule
    | None ->
    (* 4. Tier 4/5: Quantifier instantiation *)
    match find_tier4_rule sequent with
    | Some rule -> apply_quantifier_rule stats (max_depth - 1) term_limit used sequent rule
    | None -> None


(** Apply a quantifier rule. Tries all terms in the Herbrand universe. *)
and apply_quantifier_rule stats depth term_limit used sequent rule =
  let terms = enumerate_terms (functions_of_sequent sequent) term_limit in
  match rule with
  | ForallLeft (i, _) ->
    let f = List.nth sequent.antecedent i in
    let x, body = match f with Forall(x, b) -> x, b | _ -> failwith "ForallL" in
    let rec try_terms = function
      | [] -> 
          (* Tier 5: Fallback to fresh variable if all terms fail or were used *)
          let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
          let z' = variant "z" avoid in
          let body' = subst [(x, Var z')] body in
          let ant_rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
          let s' = { sequent with antecedent = body' :: (ant_rest @ [f]) } in
          stats.inst_attempts <- stats.inst_attempts + 1;
          (match search stats depth term_limit ((f, Var z') :: used) s' with
           | Some tree -> Some (Inference (ForallLeft (i, Var z'), sequent, [tree]))
           | None -> None)
      | t :: ts ->
          if List.mem (f, t) used then try_terms ts
          else
            let body' = subst [(x, t)] body in
            let ant_rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
            let s' = { sequent with antecedent = body' :: (ant_rest @ [f]) } in
            stats.inst_attempts <- stats.inst_attempts + 1;
            match search stats depth term_limit ((f, t) :: used) s' with
            | Some tree -> Some (Inference (ForallLeft (i, t), sequent, [tree]))
            | None -> try_terms ts
    in try_terms terms

  | ExistsRight (i, _) ->
    let f = List.nth sequent.succedent i in
    let x, body = match f with Exists(x, b) -> x, b | _ -> failwith "ExistsR" in
    let rec try_terms = function
      | [] -> 
          (* Tier 5: Fallback to fresh variable *)
          let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
          let z' = variant "z" avoid in
          let body' = subst [(x, Var z')] body in
          let suc_rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
          let s' = { sequent with succedent = body' :: (suc_rest @ [f]) } in
          stats.inst_attempts <- stats.inst_attempts + 1;
          (match search stats depth term_limit ((f, Var z') :: used) s' with
           | Some tree -> Some (Inference (ExistsRight (i, Var z'), sequent, [tree]))
           | None -> None)
      | t :: ts ->
          if List.mem (f, t) used then try_terms ts
          else
            let body' = subst [(x, t)] body in
            let suc_rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
            let s' = { sequent with succedent = body' :: (suc_rest @ [f]) } in
            stats.inst_attempts <- stats.inst_attempts + 1;
            match search stats depth term_limit ((f, t) :: used) s' with
            | Some tree -> Some (Inference (ExistsRight (i, t), sequent, [tree]))
            | None -> try_terms ts
    in try_terms terms
  | _ -> failwith "Invalid quantifier rule"

(** Apply a specific rule at a sequent. *)
and apply_rule stats depth term_limit used sequent rule =
  let map_children trees = match rule with
    | AndLeft _ | OrRight _ | ImpliesRight _ | NotLeft _ | NotRight _ | IffLeft _ | ForallRight _ | ExistsLeft _ ->
        Inference (rule, sequent, trees)
    | AndRight _ | OrLeft _ | ImpliesLeft _ | IffRight _ ->
        Inference (rule, sequent, trees)
    | _ -> failwith "Unexpected rule"
  in
  let children_sequents = match rule with
    | AndLeft i ->
        let a, b = match List.nth sequent.antecedent i with And(a,b) -> a,b | _ -> failwith "AndL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = a :: b :: ant' }]
    | OrRight i ->
        let a, b = match List.nth sequent.succedent i with Or(a,b) -> a,b | _ -> failwith "OrR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = a :: b :: suc' }]
    | ImpliesRight i ->
        let a, b = match List.nth sequent.succedent i with Implies(a,b) -> a,b | _ -> failwith "ImpR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ antecedent = a :: sequent.antecedent; succedent = b :: suc' }]
    | NotLeft i ->
        let a = match List.nth sequent.antecedent i with Not a -> a | _ -> failwith "NotL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ antecedent = ant'; succedent = a :: sequent.succedent }]
    | NotRight i ->
        let a = match List.nth sequent.succedent i with Not a -> a | _ -> failwith "NotR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ antecedent = a :: sequent.antecedent; succedent = suc' }]
    | IffLeft i ->
        let a, b = match List.nth sequent.antecedent i with Iff(a,b) -> a,b | _ -> failwith "IffL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = Implies(a,b) :: Implies(b,a) :: ant' }]
    | ForallRight (i, _) ->
        let x, body = match List.nth sequent.succedent i with Forall(x, b) -> x, b | _ -> failwith "∀R" in
        let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
        let x' = variant x avoid in
        let body' = subst [(x, Var x')] body in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = body' :: suc' }]
    | ExistsLeft (i, _) ->
        let x, body = match List.nth sequent.antecedent i with Exists(x, b) -> x, b | _ -> failwith "∃L" in
        let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
        let x' = variant x avoid in
        let body' = subst [(x, Var x')] body in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = body' :: ant' }]
    | AndRight i ->
        let a, b = match List.nth sequent.succedent i with And(a,b) -> a,b | _ -> failwith "AndR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = a :: suc' }; { sequent with succedent = b :: suc' }]
    | OrLeft i ->
        let a, b = match List.nth sequent.antecedent i with Or(a,b) -> a,b | _ -> failwith "OrL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = a :: ant' }; { sequent with antecedent = b :: ant' }]
    | ImpliesLeft i ->
        let a, b = match List.nth sequent.antecedent i with Implies(a,b) -> a,b | _ -> failwith "ImpL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ antecedent = ant'; succedent = a :: sequent.succedent }; { sequent with antecedent = b :: ant' }]
    | IffRight i ->
        let a, b = match List.nth sequent.succedent i with Iff(a,b) -> a,b | _ -> failwith "IffR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = Implies(a,b) :: suc' }; { sequent with succedent = Implies(b,a) :: suc' }]
    | _ -> failwith "Quantifier rule in non-quantifier handler"
  in
  let rec prove_all = function
    | [] -> Some []
    | g :: gs ->
        match search stats depth term_limit used g with
        | None -> None
        | Some t -> match prove_all gs with None -> None | Some ts -> Some (t :: ts)
  in
  match prove_all children_sequents with
  | Some trees -> Some (map_children trees)
  | None -> None

and find_tier2_rule sequent =
  let rec scan_ant i = function
    | [] -> None
    | f :: fs -> match f with
      | And _ -> Some (AndLeft i) | Iff _ -> Some (IffLeft i) | Not _ -> Some (NotLeft i)
      | Exists _ -> Some (ExistsLeft (i, "_")) | _ -> scan_ant (i+1) fs
  in
  let rec scan_suc i = function
    | [] -> None
    | f :: fs -> match f with
      | Or _ -> Some (OrRight i) | Implies _ -> Some (ImpliesRight i) | Not _ -> Some (NotRight i)
      | Forall _ -> Some (ForallRight (i, "_")) | _ -> scan_suc (i+1) fs
  in
  match scan_ant 0 sequent.antecedent with Some r -> Some r | None -> scan_suc 0 sequent.succedent

and find_tier3_rule sequent =
  let rec scan_ant i = function
    | [] -> None
    | f :: fs -> match f with
      | Or _ -> Some (OrLeft i) | Implies _ -> Some (ImpliesLeft i) | _ -> scan_ant (i+1) fs
  in
  let rec scan_suc i = function
    | [] -> None
    | f :: fs -> match f with
      | And _ -> Some (AndRight i) | Iff _ -> Some (IffRight i) | _ -> scan_suc (i+1) fs
  in
  match scan_ant 0 sequent.antecedent with Some r -> Some r | None -> scan_suc 0 sequent.succedent

and find_tier4_rule sequent =
  let rec scan_ant i = function
    | [] -> None
    | Forall _ :: _ -> Some (ForallLeft (i, Var "_")) | _ :: fs -> scan_ant (i+1) fs
  in
  let rec scan_suc i = function
    | [] -> None
    | Exists _ :: _ -> Some (ExistsRight (i, Var "_")) | _ :: fs -> scan_suc (i+1) fs
  in
  match scan_ant 0 sequent.antecedent with Some r -> Some r | None -> scan_suc 0 sequent.succedent

(* ================================================================ *)
(* MAIN ENTRY POINT                                                  *)
(* ================================================================ *)

let prove formula timeout_ms =
  let start_time = Unix.gettimeofday () in
  let stats = make_stats () in
  let sequent = { antecedent = []; succedent = [formula] } in
  let rec iterative_deepening max_d term_d =
    let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
    if elapsed > timeout_ms then { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
    else
      match search stats max_d term_d [] sequent with
      | Some _ ->
        stats.time_ms <- (Unix.gettimeofday () -. start_time) *. 1000.;
        { engine = Baseline; solved = true; stats }
      | None ->
        if max_d < 20 then iterative_deepening (max_d + 1) term_d
        else if term_d < 3 then iterative_deepening 5 (term_d + 1)
        else { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
  in iterative_deepening 1 0
