(** cnf.mli — CNF conversion interface. *)

open Types

(** Convert a formula to Negation Normal Form (NNF). *)
val nnf : formula -> formula

(** Skolemize a formula in NNF. *)
val skolemize : formula -> formula

(** Drop universal quantifiers from a formula. *)
val drop_forall : formula -> formula

(** Distribute Or over And to reach CNF. *)
val distribute : formula -> formula

(** Convert a CNF formula into a list of clauses (disjunctions of literals). *)
val clausify : formula -> clause list

(** The full transformation pipeline from formula to clauses. *)
val to_clauses : formula -> clause list
