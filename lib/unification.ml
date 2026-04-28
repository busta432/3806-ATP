(** unification.ml — First-order unification algorithm.
    
    Implements Robinson's unification algorithm with occurs check.
    Shared by Engine 2 (unification-guided instantiation, I4) and
    Engine 3 (resolution — literal unification).
    
    Reference:
    - Robinson, J.A. (1965). "A Machine-Oriented Logic Based on the
      Resolution Principle". JACM, 12(1).
    - Harrison (2009), Handbook of Practical Logic, Section 3.9 *)

open Types

(* ================================================================ *)
(* SUBSTITUTION APPLICATION                                          *)
(* ================================================================ *)

(** Apply a substitution to a term (chase variable bindings). *)
let rec apply (sigma : substitution) = function
  | Var x ->
    (match List.assoc_opt x sigma with
     | Some t -> apply sigma t  (* Chase chains: x -> y -> ... *)
     | None -> Var x)
  | Func (f, args) ->
    Func (f, List.map (apply sigma) args)

(** Apply a substitution to a formula. *)
let rec apply_to_formula sigma = function
  | Top -> Top
  | Bot -> Bot
  | Pred (p, args) -> Pred (p, List.map (apply sigma) args)
  | Not f -> Not (apply_to_formula sigma f)
  | And (f1, f2) -> And (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Or (f1, f2) -> Or (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Implies (f1, f2) -> Implies (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Iff (f1, f2) -> Iff (apply_to_formula sigma f1, apply_to_formula sigma f2)
  | Forall (x, f) -> Forall (x, apply_to_formula sigma f)
  | Exists (x, f) -> Exists (x, apply_to_formula sigma f)

(** Apply a substitution to a sequent. *)
let apply_to_sequent sigma s =
  { antecedent = List.map (apply_to_formula sigma) s.antecedent;
    succedent = List.map (apply_to_formula sigma) s.succedent }

(** Apply a substitution to a literal. *)
let apply_literal sigma = function
  | Pos (p, args) -> Pos (p, List.map (apply sigma) args)
  | Neg (p, args) -> Neg (p, List.map (apply sigma) args)

(** Apply a substitution to a clause. *)
let apply_clause sigma clause =
  List.map (apply_literal sigma) clause

(* ================================================================ *)
(* OCCURS CHECK                                                      *)
(* ================================================================ *)

(** Check if variable x occurs in term t (after applying sigma).
    Prevents creation of infinite terms like x = f(x). *)
let rec occurs x sigma = function
  | Var y ->
    if x = y then true
    else
      (match List.assoc_opt y sigma with
       | Some t -> occurs x sigma t
       | None -> false)
  | Func (_, args) ->
    List.exists (occurs x sigma) args

(* ================================================================ *)
(* UNIFICATION                                                       *)
(* ================================================================ *)

(** Unify a list of term pairs under the current substitution.
    Returns [Some sigma'] on success, [None] on failure.
    
    This implements Robinson's algorithm with the following invariant:
    at each step, the current sigma is a partial solution and the
    pair list represents remaining constraints to solve. *)
let rec unify (sigma : substitution) (pairs : (term * term) list) : substitution option =
  match pairs with
  | [] -> Some sigma
  | (s, t) :: rest ->
    let s' = apply sigma s in
    let t' = apply sigma t in
    unify_terms sigma s' t' rest

and unify_terms sigma s t rest =
  match s, t with
  | _ when s = t ->
    (* Identical terms — constraint satisfied *)
    unify sigma rest
  | Var x, t' when is_metavar x ->
    if occurs x sigma t' then None  (* Occurs check *)
    else unify ((x, t') :: sigma) rest
  | t', Var x when is_metavar x ->
    if occurs x sigma t' then None  (* Occurs check *)
    else unify ((x, t') :: sigma) rest
  | Func (f, args1), Func (g, args2) ->
    if f <> g || List.length args1 <> List.length args2 then None
    else
      let new_pairs = List.combine args1 args2 in
      unify sigma (new_pairs @ rest)

(** Attempt to unify two terms starting from an empty substitution. *)
let unify_terms_fresh s t =
  unify [] [(s, t)]

(* ================================================================ *)
(* LITERAL UNIFICATION                                               *)
(* ================================================================ *)

(** Unify two literals (for resolution).
    Two literals can unify if they have the same predicate and polarity,
    and their argument lists unify. *)
let unify_literals sigma l1 l2 =
  match l1, l2 with
  | Pos (p, args1), Pos (q, args2)
  | Neg (p, args1), Neg (q, args2) ->
    if p <> q || List.length args1 <> List.length args2 then None
    else
      let pairs = List.combine args1 args2 in
      unify sigma pairs
  | _ -> None

(** Unify complementary literals (for resolution: one positive, one negative).
    Checks if Pos(P, args1) can unify with Neg(P, args2). *)
let unify_complementary sigma l1 l2 =
  match l1, l2 with
  | Pos (p, args1), Neg (q, args2)
  | Neg (q, args2), Pos (p, args1) ->
    if p <> q || List.length args1 <> List.length args2 then None
    else
      let pairs = List.combine args1 args2 in
      unify sigma pairs
  | _ -> None

(* ================================================================ *)
(* SUBSTITUTION UTILITIES                                            *)
(* ================================================================ *)

(** Compose two substitutions: apply sigma2 after sigma1.
    Result maps x -> apply sigma2 (sigma1(x)). *)
let compose sigma1 sigma2 =
  let updated = List.map (fun (x, t) -> (x, apply sigma2 t)) sigma1 in
  let new_bindings = List.filter (fun (x, _) ->
    not (List.mem_assoc x sigma1)
  ) sigma2 in
  updated @ new_bindings

(** Restrict a substitution to a set of variables. *)
let restrict sigma vars =
  List.filter (fun (x, _) -> List.mem x vars) sigma

(** Pretty-print a substitution. *)
let pp_subst sigma =
  if sigma = [] then "{}"
  else
    "{" ^
    String.concat ", " (List.map (fun (x, t) ->
      x ^ " ↦ " ^ Printer.pp_term t
    ) sigma) ^
    "}"
