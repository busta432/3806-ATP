(** cnf.ml — CNF conversion pipeline for the Resolution Engine.
    
    Transforms a formula into a set of clauses (sets of literals).
    Pipeline: Negate -> Simplify -> NNF -> Skolemize -> Drop Forall -> Distribute -> Clausify. *)

open Types
open Formula

(** Convert a formula to Negation Normal Form (NNF).
    Push negations inwards until they are only in front of predicates. *)
let rec nnf = function
  | Not (Not a) -> nnf a
  | Not (And (a, b)) -> Or (nnf (Not a), nnf (Not b))
  | Not (Or (a, b)) -> And (nnf (Not a), nnf (Not b))
  | Not (Implies (a, b)) -> And (nnf a, nnf (Not b))
  | Not (Iff (a, b)) -> Or (And (nnf a, nnf (Not b)), And (nnf (Not a), nnf b))
  | Not (Forall (x, a)) -> Exists (x, nnf (Not a))
  | Not (Exists (x, a)) -> Forall (x, nnf (Not a))
  | And (a, b) -> And (nnf a, nnf b)
  | Or (a, b) -> Or (nnf a, nnf b)
  | Implies (a, b) -> Or (nnf (Not a), nnf b)
  | Iff (a, b) -> And (Or (nnf (Not a), nnf b), Or (nnf (Not b), nnf a))
  | Forall (x, a) -> Forall (x, nnf a)
  | Exists (x, a) -> Exists (x, nnf a)
  | f -> f

(** Skolemize a formula in NNF.
    Replace existentially quantified variables with Skolem functions of
    the universally quantified variables in scope. *)
let skolemize f =
  let rec skolem (stats : int ref) (univ_vars : term list) = function
    | Top | Bot | Pred _ as f -> f
    | Not a -> Not (skolem stats univ_vars a)
    | And (a, b) -> And (skolem stats univ_vars a, skolem stats univ_vars b)
    | Or (a, b) -> Or (skolem stats univ_vars a, skolem stats univ_vars b)
    | Forall (x, a) -> Forall (x, skolem stats (Var x :: univ_vars) a)
    | Exists (x, a) ->
      let sk_name = "sk_" ^ string_of_int !stats in
      stats := !stats + 1;
      let sk_term = Func (sk_name, List.rev univ_vars) in
      skolem stats univ_vars (subst [(x, sk_term)] a)
    | Implies _ | Iff _ -> failwith "skolemize: expected NNF (no implies/iff)"
  in
  skolem (ref 0) [] f

(** Drop universal quantifiers (implicit quantification). *)
let rec drop_forall = function
  | Forall (_, a) -> drop_forall a
  | And (a, b) -> And (drop_forall a, drop_forall b)
  | Or (a, b) -> Or (drop_forall a, drop_forall b)
  | f -> f

(** Distribute Or over And to reach Conjunctive Normal Form.
    (A /\ B) \/ C  =>  (A \/ C) /\ (B \/ C) *)
let rec distribute = function
  | And (a, b) -> And (distribute a, distribute b)
  | Or (And (a, b), c) ->
    let a', b', c' = distribute a, distribute b, distribute c in
    And (distribute (Or (a', c')), distribute (Or (b', c')))
  | Or (c, And (a, b)) ->
    let a', b', c' = distribute a, distribute b, distribute c in
    And (distribute (Or (c', a')), distribute (Or (c', b')))
  | Or (a, b) ->
    let a', b' = distribute a, distribute b in
    (* We must re-check if distribution is possible after recursing *)
    (match a', b' with
     | And _, _ | _, And _ -> distribute (Or (a', b'))
     | _ -> Or (a', b'))
  | f -> f

(** Convert a CNF formula to a list of clauses (disjunctions of literals). *)
let rec clausify = function
  | And (a, b) -> clausify a @ clausify b
  | f ->
    let rec literals = function
      | Or (a, b) -> literals a @ literals b
      | Pred (p, args) -> [Pos (p, args)]
      | Not (Pred (p, args)) -> [Neg (p, args)]
      | Top -> [] (* Should have been simplified *)
      | Bot -> []
      | _ -> failwith "clausify: expected literals (NNF)"
    in
    [literals f]

(** The full transformation pipeline. *)
let to_clauses f =
  f
  |> simplify
  |> nnf
  |> skolemize
  |> drop_forall
  |> distribute
  |> clausify
