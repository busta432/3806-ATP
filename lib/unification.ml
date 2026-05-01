(** unification.ml — First-order unification algorithm.
    
    Implements Robinson's unification algorithm with occurs check.
    Extended with rank-based dependency checks for soundness in 
    metavariable-based sequent calculus (Engine 2). *)

open Types

(* ================================================================ *)
(* SUBSTITUTION APPLICATION                                          *)
(* ================================================================ *)

let rec apply (sigma : substitution) = function
  | Var x ->
    (match List.assoc_opt x sigma with
     | Some t -> apply sigma t
     | None -> Var x)
  | Func (f, args) ->
    Func (f, List.map (apply sigma) args)

let rec apply_to_formula sigma = function
  | Top -> Top | Bot -> Bot
  | Pred (p, args) -> Pred (p, List.map (apply sigma) args)
  | Not f -> Not (apply_to_formula sigma f)
  | And (f1, f2) -> And (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Or (f1, f2) -> Or (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Implies (f1, f2) -> Implies (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Iff (f1, f2) -> Iff (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Forall (x, f) -> Forall (x, apply_to_formula sigma f)
  | Exists (x, f) -> Exists (x, apply_to_formula sigma f)

let apply_to_sequent sigma s =
  { antecedent = List.map (apply_to_formula sigma) s.antecedent;
    succedent = List.map (apply_to_formula sigma) s.succedent }

let apply_literal sigma = function
  | Pos (p, args) -> Pos (p, List.map (apply sigma) args)
  | Neg (p, args) -> Neg (p, List.map (apply sigma) args)

let apply_clause sigma clause = List.map (apply_literal sigma) clause

(* ================================================================ *)
(* SOUNDNESS & OCCURS CHECK                                          *)
(* ================================================================ *)

(** Check if variable x occurs in term t (after applying sigma). *)
let rec occurs x sigma = function
  | Var y ->
    if x = y then true
    else
      (match List.assoc_opt y sigma with
       | Some t -> occurs x sigma t
       | None -> false)
  | Func (_, args) ->
    List.exists (occurs x sigma) args

(** Soundness check for metavariables vs Eigenvariables.
    A metavariable ?m can only be unified with term t if t contains
    no Eigenvariables created after ?m.
    
    Naming convention:
    - Metavariables: ?N
    - Eigenvariables: ev_N_name (created when metavar_counter was N)
    
    Condition: if x = ?m and v = ev_n_..., then n <= m. *)
let rec check_rank x = function
  | Var y ->
      if String.length x > 0 && x.[0] = '?' && String.length y > 3 && String.sub y 0 3 = "ev_" then
        try
          let m = int_of_string (String.sub x 1 (String.length x - 1)) in
          let first_underscore = String.index_from y 3 '_' in
          let n = int_of_string (String.sub y 3 (first_underscore - 3)) in
          n <= m
        with _ -> true (* Fallback to safe if naming deviates *)
      else true
  | Func (_, args) -> List.for_all (check_rank x) args

(* ================================================================ *)
(* UNIFICATION                                                       *)
(* ================================================================ *)

let rec unify ~use_rank_check is_substitutable (sigma : substitution) (pairs : (term * term) list) : substitution option =
  match pairs with
  | [] -> Some sigma
  | (s, t) :: rest ->
    let s' = apply sigma s in
    let t' = apply sigma t in
    unify_terms ~use_rank_check is_substitutable sigma s' t' rest

and unify_terms ~use_rank_check is_substitutable sigma s t rest =
  match s, t with
  | _ when s = t -> unify ~use_rank_check is_substitutable sigma rest
  | Var x, Var y when use_rank_check && is_substitutable x && is_substitutable y ->
      (* Both are metavariables. Bind the newer (higher rank) to the older (lower rank).
         This ensures the resulting variable has the strictest scope. *)
      let get_rank s = 
        try int_of_string (String.sub s 1 (String.length s - 1)) 
        with _ -> 0
      in
      if get_rank x <= get_rank y then
        unify ~use_rank_check is_substitutable ((y, Var x) :: sigma) rest
      else
        unify ~use_rank_check is_substitutable ((x, Var y) :: sigma) rest
  | Var x, t' when is_substitutable x ->
    if occurs x sigma t' || (use_rank_check && not (check_rank x t')) then None
    else unify ~use_rank_check is_substitutable ((x, t') :: sigma) rest
  | t', Var x when is_substitutable x ->
    if occurs x sigma t' || (use_rank_check && not (check_rank x t')) then None
    else unify ~use_rank_check is_substitutable ((x, t') :: sigma) rest
  | Func (f, args1), Func (g, args2) ->
    if f <> g || List.length args1 <> List.length args2 then None
    else unify ~use_rank_check is_substitutable sigma (List.combine args1 args2 @ rest)
  | _ -> None

let unify_terms_fresh ~use_rank_check is_subst s t = unify ~use_rank_check is_subst [] [(s, t)]

let unify_literals ~use_rank_check is_subst sigma l1 l2 =
  match l1, l2 with
  | Pos (p, args1), Pos (q, args2) | Neg (p, args1), Neg (q, args2) ->
    if p <> q || List.length args1 <> List.length args2 then None
    else unify ~use_rank_check is_subst sigma (List.combine args1 args2)
  | _ -> None

let unify_complementary ~use_rank_check is_subst sigma l1 l2 =
  match l1, l2 with
  | Pos (p, args1), Neg (q, args2) | Neg (q, args2), Pos (p, args1) ->
    if p <> q || List.length args1 <> List.length args2 then None
    else unify ~use_rank_check is_subst sigma (List.combine args1 args2)
  | _ -> None

(* ================================================================ *)
(* SUBSTITUTION UTILITIES                                            *)
(* ================================================================ *)

let compose sigma1 sigma2 =
  let updated = List.map (fun (x, t) -> (x, apply sigma2 t)) sigma1 in
  let new_bindings = List.filter (fun (x, _) -> not (List.mem_assoc x sigma1)) sigma2 in
  updated @ new_bindings

let restrict sigma vars = List.filter (fun (x, _) -> List.mem x vars) sigma

let pp_subst sigma =
  if sigma = [] then "{}"
  else "{" ^ String.concat ", " (List.map (fun (x, t) -> x ^ " ↦ " ^ Printer.pp_term t) sigma) ^ "}"
