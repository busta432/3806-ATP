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
          (* Cartesion product of terms for arguments *)
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
    If none, add a default constant "c" to ensure Herbrand universe is non-empty. *)
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

(** Check if a sequent is an identity axiom: A ⊢ A. *)
let is_identity { antecedent; succedent } =
  List.exists (fun a ->
    List.exists (fun s -> formula_equal a s) succedent
  ) antecedent

(** Check for trivial axioms: Γ, ⊥ ⊢ Δ or Γ ⊢ ⊤, Δ. *)
let is_trivial { antecedent; succedent } =
  List.mem Bot antecedent || List.mem Top succedent

(** Main search function.
    [max_depth]: Depth limit for the proof tree.
    [term_limit]: Depth limit for generated terms.
    [sequent]: The current goal. *)
let rec search (stats : prover_stats) max_depth term_limit sequent =
  stats.steps <- stats.steps + 1;
  stats.max_depth <- max (20 - max_depth) stats.max_depth;

  (* 1. Axiom check (Tier 1) *)
  if is_identity sequent then
    Some (Axiom (Identity, sequent))
  else if List.mem Top sequent.succedent then
    Some (Axiom (TopRight, sequent))
  else if List.mem Bot sequent.antecedent then
    Some (Axiom (BotLeft, sequent))
  else if max_depth <= 0 then
    None
  else
    (* 2. Rule selection (Algorithm 2 Greedy Scan) *)
    match find_first_rule sequent with
    | None -> None
    | Some (ForallLeft _ as r) | Some (ExistsRight _ as r) ->
        apply_quantifier_rule stats (max_depth - 1) term_limit sequent r
    | Some rule ->
        apply_rule stats (max_depth - 1) term_limit sequent rule

(** Apply a quantifier rule. Tries all terms in the Herbrand universe. *)
and apply_quantifier_rule stats depth term_limit sequent rule =
  let terms = enumerate_terms (functions_of_sequent sequent) term_limit in
  match rule with
  | ForallLeft (i, _) ->
    let f = List.nth sequent.antecedent i in
    let x, body = match f with Forall(x, b) -> x, b | _ -> failwith "ForallL" in
    let rec try_terms = function
      | [] -> None
      | t :: ts ->
          let body' = subst [(x, t)] body in
          let ant_rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
          let s' = { sequent with antecedent = body' :: (ant_rest @ [f]) } in
          stats.inst_attempts <- stats.inst_attempts + 1;
          match search stats depth term_limit s' with
          | Some tree -> Some (Inference (ForallLeft (i, t), sequent, [tree]))
          | None -> try_terms ts
    in try_terms terms

  | ExistsRight (i, _) ->
    let f = List.nth sequent.succedent i in
    let x, body = match f with Exists(x, b) -> x, b | _ -> failwith "ExistsR" in
    let rec try_terms = function
      | [] -> None
      | t :: ts ->
          let body' = subst [(x, t)] body in
          let suc_rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
          let s' = { sequent with succedent = body' :: (suc_rest @ [f]) } in
          stats.inst_attempts <- stats.inst_attempts + 1;
          match search stats depth term_limit s' with
          | Some tree -> Some (Inference (ExistsRight (i, t), sequent, [tree]))
          | None -> try_terms ts
    in try_terms terms
  | _ -> failwith "Invalid quantifier rule"

(** Apply a specific rule at a sequent. *)
and apply_rule stats depth term_limit sequent rule =
  match rule with
  | AndLeft i ->
    let a, b = match List.nth sequent.antecedent i with And(a,b) -> a,b | _ -> failwith "AndLeft" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    let s' = { sequent with antecedent = a :: b :: ant' } in
    map_proof_tree (Inference (AndLeft i, sequent, [])) [s'] stats depth term_limit

  | AndRight i ->
    let a, b = match List.nth sequent.succedent i with And(a,b) -> a,b | _ -> failwith "AndRight" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    let s1 = { sequent with succedent = a :: suc' } in
    let s2 = { sequent with succedent = b :: suc' } in
    map_proof_tree (Inference (AndRight i, sequent, [])) [s1; s2] stats depth term_limit

  | OrLeft i ->
    let a, b = match List.nth sequent.antecedent i with Or(a,b) -> a,b | _ -> failwith "OrLeft" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    let s1 = { sequent with antecedent = a :: ant' } in
    let s2 = { sequent with antecedent = b :: ant' } in
    map_proof_tree (Inference (OrLeft i, sequent, [])) [s1; s2] stats depth term_limit

  | OrRight i ->
    let a, b = match List.nth sequent.succedent i with Or(a,b) -> a,b | _ -> failwith "OrRight" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    let s' = { sequent with succedent = a :: b :: suc' } in
    map_proof_tree (Inference (OrRight i, sequent, [])) [s'] stats depth term_limit

  | ImpliesLeft i ->
    let a, b = match List.nth sequent.antecedent i with Implies(a,b) -> a,b | _ -> failwith "ImpliesLeft" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    let s1 = { antecedent = ant'; succedent = a :: sequent.succedent } in
    let s2 = { sequent with antecedent = b :: ant' } in
    map_proof_tree (Inference (ImpliesLeft i, sequent, [])) [s1; s2] stats depth term_limit

  | ImpliesRight i ->
    let a, b = match List.nth sequent.succedent i with Implies(a,b) -> a,b | _ -> failwith "ImpliesRight" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    let s' = { antecedent = a :: sequent.antecedent; succedent = b :: suc' } in
    map_proof_tree (Inference (ImpliesRight i, sequent, [])) [s'] stats depth term_limit

  | NotLeft i ->
    let a = match List.nth sequent.antecedent i with Not a -> a | _ -> failwith "NotLeft" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    let s' = { antecedent = ant'; succedent = a :: sequent.succedent } in
    map_proof_tree (Inference (NotLeft i, sequent, [])) [s'] stats depth term_limit

  | NotRight i ->
    let a = match List.nth sequent.succedent i with Not a -> a | _ -> failwith "NotRight" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    let s' = { antecedent = a :: sequent.antecedent; succedent = suc' } in
    map_proof_tree (Inference (NotRight i, sequent, [])) [s'] stats depth term_limit

  | IffLeft i ->
    let a, b = match List.nth sequent.antecedent i with Iff(a,b) -> a,b | _ -> failwith "IffLeft" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    let s' = { sequent with antecedent = Implies(a,b) :: Implies(b,a) :: ant' } in
    map_proof_tree (Inference (IffLeft i, sequent, [])) [s'] stats depth term_limit

  | IffRight i ->
    let a, b = match List.nth sequent.succedent i with Iff(a,b) -> a,b | _ -> failwith "IffRight" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    let s1 = { sequent with succedent = Implies(a,b) :: suc' } in
    let s2 = { sequent with succedent = Implies(b,a) :: suc' } in
    map_proof_tree (Inference (IffRight i, sequent, [])) [s1; s2] stats depth term_limit

  | ForallRight (i, _) ->
    let x, body = match List.nth sequent.succedent i with Forall(x, b) -> x, b | _ -> failwith "ForallRight" in
    let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
    let x' = variant x avoid in
    let body' = subst [(x, Var x')] body in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    let s' = { sequent with succedent = body' :: suc' } in
    map_proof_tree (Inference (ForallRight (i, x'), sequent, [])) [s'] stats depth term_limit

  | ExistsLeft (i, _) ->
    let x, body = match List.nth sequent.antecedent i with Exists(x, b) -> x, b | _ -> failwith "ExistsLeft" in
    let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
    let x' = variant x avoid in
    let body' = subst [(x, Var x')] body in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    let s' = { sequent with antecedent = body' :: ant' } in
    map_proof_tree (Inference (ExistsLeft (i, x'), sequent, [])) [s'] stats depth term_limit

  | _ -> failwith "Non-quantifier rule failure or missing implementation"

and map_proof_tree inf goals stats depth term_limit =
  let rec prove_all = function
    | [] -> Some []
    | g :: gs ->
      match search stats depth term_limit g with
      | None -> None
      | Some t ->
        match prove_all gs with
        | None -> None
        | Some ts -> Some (t :: ts)
  in
  match prove_all goals with
  | Some trees -> Some (match inf with Inference (r, s, _) -> Inference (r, s, trees) | _ -> failwith "Expected Inference")
  | None -> None

and find_first_rule sequent =
  let rec scan_left i = function
    | [] -> None
    | f :: fs ->
      (match f with
       | And _ -> Some (AndLeft i)
       | Or _ -> Some (OrLeft i)
       | Implies _ -> Some (ImpliesLeft i)
       | Iff _ -> Some (IffLeft i)
       | Not _ -> Some (NotLeft i)
       | Forall _ -> Some (ForallLeft (i, Var "_"))
       | Exists _ -> Some (ExistsLeft (i, "_"))
       | _ -> scan_left (i + 1) fs)
  in
  let rec scan_right i = function
    | [] -> None
    | f :: fs ->
      (match f with
       | And _ -> Some (AndRight i)
       | Or _ -> Some (OrRight i)
       | Implies _ -> Some (ImpliesRight i)
       | Iff _ -> Some (IffRight i)
       | Not _ -> Some (NotRight i)
       | Forall _ -> Some (ForallRight (i, "_"))
       | Exists _ -> Some (ExistsRight (i, Var "_"))
       | _ -> scan_right (i + 1) fs)
  in
  match scan_left 0 sequent.antecedent with
  | Some r -> Some r
  | None -> scan_right 0 sequent.succedent

(* ================================================================ *)
(* MAIN ENTRY POINT                                                  *)
(* ================================================================ *)

(** Prove a formula using Engine 1. 
    Uses iterative deepening over both tree depth and term depth. *)
let prove formula timeout_ms =
  let start_time = Unix.gettimeofday () in
  let stats = make_stats () in
  let sequent = { antecedent = []; succedent = [formula] } in
  
  let rec iterative_deepening max_d term_d =
    let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
    if elapsed > timeout_ms then
      { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
    else
      match search stats max_d term_d sequent with
      | Some _ ->
        let end_time = Unix.gettimeofday () in
        stats.time_ms <- (end_time -. start_time) *. 1000.;
        { engine = Baseline; solved = true; stats }
      | None ->
        (* Broaden search: increase tree depth, then term depth *)
        if max_d < 20 then iterative_deepening (max_d + 1) term_d
        else if term_d < 3 then iterative_deepening 5 (term_d + 1)
        else { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
  in
  iterative_deepening 1 0
