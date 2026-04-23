(** formula.ml — Core formula manipulation operations.
    
    Provides substitution, free variable computation, simplification,
    NNF conversion, Skolemization, and CNF conversion. These operations
    are shared across all three engines.
    
    References:
    - Harrison (2009), Handbook of Practical Logic, Ch. 3-5
    - Hou (2021), Fundamentals of Logic and Computation, Ch. 2-3 *)

open Types

(* ================================================================ *)
(* VARIABLE OPERATIONS                                               *)
(* ================================================================ *)

(** Free variables of a term. *)
let rec term_vars = function
  | Var x -> [x]
  | Func (_, args) -> List.concat_map term_vars args

(** Free variables of a formula (respecting quantifier binding). *)
let rec free_vars = function
  | Top | Bot -> []
  | Pred (_, args) -> List.concat_map term_vars args
  | Not a -> free_vars a
  | And (a, b) | Or (a, b) | Implies (a, b) | Iff (a, b) ->
    free_vars a @ free_vars b
  | Forall (x, a) | Exists (x, a) ->
    List.filter (fun v -> v <> x) (free_vars a)

(** Remove duplicates from a list, preserving order. *)
let unique lst =
  let seen = Hashtbl.create 16 in
  List.filter (fun x ->
    if Hashtbl.mem seen x then false
    else (Hashtbl.add seen x (); true)
  ) lst

(** Free variables without duplicates. *)
let free_vars_unique f = unique (free_vars f)

(** Generate a fresh variable name that doesn't clash with any in [avoid].
    Appends primes: x, x', x'', ... *)
let rec variant x avoid =
  if List.mem x avoid then variant (x ^ "'") avoid
  else x

(* ================================================================ *)
(* SUBSTITUTION                                                      *)
(* ================================================================ *)

(** Apply a substitution to a term. *)
let rec term_subst (sigma : substitution) = function
  | Var x ->
    (match List.assoc_opt x sigma with
     | Some t -> t
     | None -> Var x)
  | Func (f, args) ->
    Func (f, List.map (term_subst sigma) args)

(** Apply a substitution to a formula (capture-avoiding).
    When substituting into a quantifier ∀x.A or ∃x.A:
    - If x is in the domain of sigma, skip (shadowed)
    - If the substitution would capture x, rename the bound variable *)
let rec subst (sigma : substitution) = function
  | Top -> Top
  | Bot -> Bot
  | Pred (p, args) -> Pred (p, List.map (term_subst sigma) args)
  | Not a -> Not (subst sigma a)
  | And (a, b) -> And (subst sigma a, subst sigma b)
  | Or (a, b) -> Or (subst sigma a, subst sigma b)
  | Implies (a, b) -> Implies (subst sigma a, subst sigma b)
  | Iff (a, b) -> Iff (subst sigma a, subst sigma b)
  | Forall (x, a) -> subst_quant (fun x a -> Forall (x, a)) x a sigma
  | Exists (x, a) -> subst_quant (fun x a -> Exists (x, a)) x a sigma

and subst_quant quant x body sigma =
  (* Remove x from substitution domain (shadowing) *)
  let sigma' = List.filter (fun (v, _) -> v <> x) sigma in
  if sigma' = [] then quant x body
  else
    (* Check if x would be captured by any term in the substitution range *)
    let range_vars = List.concat_map (fun (_, t) -> term_vars t) sigma' in
    if List.mem x range_vars then
      (* x would be captured — rename the bound variable *)
      let all_vars = range_vars @ free_vars body in
      let x' = variant x all_vars in
      let body' = subst [(x, Var x')] body in
      quant x' (subst sigma' body')
    else
      quant x (subst sigma' body)

(* ================================================================ *)
(* SIMPLIFICATION                                                    *)
(* ================================================================ *)

(** Simplify a formula by eliminating trivial subformulae.
    E.g., ⊤ ∧ P → P, ⊥ ∨ P → P, ¬⊤ → ⊥, etc. *)
let rec simplify = function
  | Not Top -> Bot
  | Not Bot -> Top
  | Not (Not a) -> simplify a
  | Not a -> Not (simplify a)
  | And (Top, b) -> simplify b
  | And (a, Top) -> simplify a
  | And (Bot, _) -> Bot
  | And (_, Bot) -> Bot
  | And (a, b) ->
    let a' = simplify a and b' = simplify b in
    if a' = b' then a' else And (a', b')
  | Or (Top, _) -> Top
  | Or (_, Top) -> Top
  | Or (Bot, b) -> simplify b
  | Or (a, Bot) -> simplify a
  | Or (a, b) ->
    let a' = simplify a and b' = simplify b in
    if a' = b' then a' else Or (a', b')
  | Implies (Top, b) -> simplify b
  | Implies (_, Top) -> Top
  | Implies (Bot, _) -> Top
  | Implies (a, Bot) -> simplify (Not a)
  | Implies (a, b) -> Implies (simplify a, simplify b)
  | Iff (Top, b) -> simplify b
  | Iff (a, Top) -> simplify a
  | Iff (Bot, b) -> simplify (Not b)
  | Iff (a, Bot) -> simplify (Not a)
  | Iff (a, b) ->
    let a' = simplify a and b' = simplify b in
    if a' = b' then Top else Iff (a', b')
  | Forall (x, a) ->
    let a' = simplify a in
    if not (List.mem x (free_vars a')) then a'
    else Forall (x, a')
  | Exists (x, a) ->
    let a' = simplify a in
    if not (List.mem x (free_vars a')) then a'
    else Exists (x, a')
  | f -> f  (* Top, Bot, Pred — already simple *)

(* ================================================================ *)
(* NEGATION NORMAL FORM (NNF)                                        *)
(* ================================================================ *)

(** Convert a formula to Negation Normal Form.
    Pushes negations down to literals, eliminates → and ↔.
    
    Used by: Engine 2 (preprocessing), Engine 3 (CNF pipeline). *)
let rec nnf = function
  | Top -> Top
  | Bot -> Bot
  | Pred _ as p -> p
  | Not (Not a) -> nnf a
  | Not Top -> Bot
  | Not Bot -> Top
  | Not (And (a, b)) -> Or (nnf (Not a), nnf (Not b))       (* De Morgan *)
  | Not (Or (a, b)) -> And (nnf (Not a), nnf (Not b))       (* De Morgan *)
  | Not (Implies (a, b)) -> And (nnf a, nnf (Not b))
  | Not (Iff (a, b)) ->
    Or (And (nnf a, nnf (Not b)), And (nnf (Not a), nnf b))
  | Not (Forall (x, a)) -> Exists (x, nnf (Not a))
  | Not (Exists (x, a)) -> Forall (x, nnf (Not a))
  | Not (Pred _) as np -> np                                   (* Literal *)
  | And (a, b) -> And (nnf a, nnf b)
  | Or (a, b) -> Or (nnf a, nnf b)
  | Implies (a, b) -> Or (nnf (Not a), nnf b)                (* Eliminate → *)
  | Iff (a, b) ->                                              (* Eliminate ↔ *)
    And (Or (nnf (Not a), nnf b), Or (nnf a, nnf (Not b)))
  | Forall (x, a) -> Forall (x, nnf a)
  | Exists (x, a) -> Exists (x, nnf a)

(* ================================================================ *)
(* SKOLEMIZATION                                                     *)
(* ================================================================ *)

(** Global counter for generating unique Skolem function names. *)
let skolem_counter = ref 0

(** Reset the Skolem counter (for testing). *)
let reset_skolem () = skolem_counter := 0

(** Skolemize a formula (remove existential quantifiers).
    Assumes input is in NNF.
    
    ∃x. A(x) with free universals y1,...,yn becomes A(sk_i(y1,...,yn))
    where sk_i is a fresh Skolem function symbol.
    
    Reference: Harrison (2009), Section 3.6 *)
let rec skolemize_aux univ_vars = function
  | Forall (x, a) -> Forall (x, skolemize_aux (x :: univ_vars) a)
  | Exists (x, a) ->
    incr skolem_counter;
    let sk_name = "sk" ^ string_of_int !skolem_counter in
    let sk_args = List.map (fun v -> Var v) (List.rev univ_vars) in
    let sk_term = Func (sk_name, sk_args) in
    let body = subst [(x, sk_term)] a in
    skolemize_aux univ_vars body
  | And (a, b) -> And (skolemize_aux univ_vars a, skolemize_aux univ_vars b)
  | Or (a, b) -> Or (skolemize_aux univ_vars a, skolemize_aux univ_vars b)
  | Not a -> Not (skolemize_aux univ_vars a)
  | f -> f  (* Pred, Top, Bot — no quantifiers *)

(** Skolemize a formula. Assumes input is in NNF. *)
let skolemize f = skolemize_aux [] f

(* ================================================================ *)
(* DROP UNIVERSAL QUANTIFIERS                                        *)
(* ================================================================ *)

(** Remove all universal quantifiers (they are implicit in CNF).
    Assumes input is skolemized (no ∃ remaining). *)
let rec drop_forall = function
  | Forall (_, a) -> drop_forall a
  | And (a, b) -> And (drop_forall a, drop_forall b)
  | Or (a, b) -> Or (drop_forall a, drop_forall b)
  | Not a -> Not (drop_forall a)
  | f -> f

(* ================================================================ *)
(* CNF DISTRIBUTION                                                  *)
(* ================================================================ *)

(** Distribute ∨ over ∧ to produce CNF.
    Input: quantifier-free NNF formula.
    Output: conjunction of disjunctions. *)
let rec distrib = function
  | Or (And (a, b), c) ->
    And (distrib (Or (a, c)), distrib (Or (b, c)))
  | Or (a, And (b, c)) ->
    And (distrib (Or (a, b)), distrib (Or (a, c)))
  | Or (a, b) ->
    let a' = distrib a and b' = distrib b in
    (* Re-check after distributing sub-formulae *)
    (match a', b' with
     | And (p, q), _ -> And (distrib (Or (p, b')), distrib (Or (q, b')))
     | _, And (p, q) -> And (distrib (Or (a', p)), distrib (Or (a', q)))
     | _ -> Or (a', b'))
  | And (a, b) -> And (distrib a, distrib b)
  | f -> f

(* ================================================================ *)
(* CLAUSIFICATION                                                    *)
(* ================================================================ *)

(** Extract a single clause (disjunction of literals) from a
    flat disjunctive formula. *)
let rec disjuncts_to_clause = function
  | Or (a, b) -> disjuncts_to_clause a @ disjuncts_to_clause b
  | Pred (p, args) -> [Pos (p, args)]
  | Not (Pred (p, args)) -> [Neg (p, args)]
  | Top -> []  (* True literal — clause is trivially true, but handle upstream *)
  | Bot -> []  (* False literal — ignore *)
  | f -> failwith (Printf.sprintf "disjuncts_to_clause: unexpected formula %s" 
                     (Printer.pp_formula f))

(** Extract all clauses from a CNF formula (conjunction of clauses). *)
let rec conjuncts_to_clauses = function
  | And (a, b) -> conjuncts_to_clauses a @ conjuncts_to_clauses b
  | f -> [disjuncts_to_clause f]

(** Full CNF conversion pipeline:
    formula → simplify → NNF → skolemize → drop ∀ → distribute → clausify
    
    Used by Engine 3 (Resolution). *)
let formula_to_cnf f =
  f
  |> simplify
  |> nnf
  |> skolemize
  |> drop_forall
  |> distrib
  |> conjuncts_to_clauses

(* ================================================================ *)
(* FORMULA NEGATION                                                  *)
(* ================================================================ *)

(** Negate a formula (used by resolution engine before CNF conversion). *)
let negate f = simplify (Not f)

(* ================================================================ *)
(* UTILITY: TERM AND FORMULA COMPARISON                              *)
(* ================================================================ *)

(** Check if two terms are syntactically equal. *)
let rec term_equal t1 t2 =
  match t1, t2 with
  | Var x, Var y -> x = y
  | Func (f, args1), Func (g, args2) ->
    f = g && List.length args1 = List.length args2
    && List.for_all2 term_equal args1 args2
  | _ -> false

(** Check if two formulae are syntactically equal. *)
let rec formula_equal f1 f2 =
  match f1, f2 with
  | Top, Top | Bot, Bot -> true
  | Pred (p, a1), Pred (q, a2) -> p = q && List.for_all2 term_equal a1 a2
  | Not a, Not b -> formula_equal a b
  | And (a1, b1), And (a2, b2)
  | Or (a1, b1), Or (a2, b2)
  | Implies (a1, b1), Implies (a2, b2)
  | Iff (a1, b1), Iff (a2, b2) -> formula_equal a1 a2 && formula_equal b1 b2
  | Forall (x, a), Forall (y, b)
  | Exists (x, a), Exists (y, b) -> x = y && formula_equal a b
  | _ -> false

(** All function symbols in a formula with their arities. *)
let rec functions_of = function
  | Top | Bot -> []
  | Pred (_, args) -> List.concat_map term_functions args
  | Not a -> functions_of a
  | And (a, b) | Or (a, b) | Implies (a, b) | Iff (a, b) ->
    functions_of a @ functions_of b
  | Forall (_, a) | Exists (_, a) -> functions_of a

and term_functions = function
  | Var _ -> []
  | Func (f, args) ->
    (f, List.length args) :: List.concat_map term_functions args

(** Constants (zero-arity functions) in a formula. *)
let constants_of f =
  unique (List.filter_map (fun (name, arity) ->
    if arity = 0 then Some name else None
  ) (functions_of f))
