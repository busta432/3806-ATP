(** types.ml — Core algebraic data types for the ATP system.
    
    Defines the representation of first-order logic terms, formulae,
    sequents, clauses, and proof structures used by all three engines.
    
    Design Decision DD-001: OCaml's algebraic data types provide
    exhaustive pattern matching, which catches missing rule cases
    at compile time. *)

(* ================================================================ *)
(* TERMS                                                             *)
(* ================================================================ *)

(** First-order terms. Variables are strings; functions/constants
    are represented uniformly with arity (constants have empty arg list). *)
type term =
  | Var of string                   (** Variable: x, y, z *)
  | Func of string * term list     (** Function/Constant: f(t1,...,tn), c = Func("c", []) *)

(*I think Func should just be Fn as this is how it is displayed in Textbook*)

(* ================================================================ *)
(* FORMULAE                                                         *)
(* ================================================================ *)

(** First-order logic formulae - constructors for logical connectives 
and quantifiers of FOL. *)

type formula =
  | Top                             (** ⊤ (verum / true) *)
  | Bot                             (** ⊥ (falsum / false) *)
  | Pred of string * term list      (** Atomic predicate: P(t1,...,tn) *)
  | Not of formula                  (** Negation: ¬A *)
  | And of formula * formula        (** Conjunction: A ∧ B *)
  | Or of formula * formula         (** Disjunction: A ∨ B *)
  | Implies of formula * formula    (** Implication: A → B *)
  | Iff of formula * formula        (** Biconditional: A ↔ B *)
  | Forall of string * formula      (** Universal: ∀x. A *)
  | Exists of string * formula      (** Existential: ∃x. A *)

(* ================================================================ *)
(* SEQUENTS (Engines 1 & 2)                                          *)
(* ================================================================ *)

(** A sequent Γ ⊢ Δ in the LK' calculus.
    Antecedent = left-hand side (assumptions).
    Succedent  = right-hand side (goals). *)
type sequent = {
  antecedent : formula list;
  succedent  : formula list;
}

(** LK' inference rules.
    For rules that target a specific formula in a list, we carry
    the index (int) of the principal formula. 
    For quantifier rules that instantiate, we carry the substitution term 
    or fresh variable. *)

type rule =
  | Identity                        (** id: A ⊢ A *)
  | TopRight                        (** ⊤R: Γ ⊢ ⊤, Δ *)
  | BotLeft                         (** ⊥L: Γ, ⊥ ⊢ Δ *)
  (* non-branching rules *)
  | AndLeft of int                  (** ∧L at index i *)
  | OrRight of int                  (** ∨R at index i *)
  | ImpliesRight of int             (** →R at index i *)
  | NotLeft of int                  (** ¬L at index i *)
  | NotRight of int                 (** ¬R at index i *)
  | IffLeft of int                  (** ↔L at index i *)
  | IffRight of int                 (** ↔R at index i *)
  | ForallRight of int * string     (** ∀R at index i, eigenvariable *)
  | ExistsLeft of int * string      (** ∃L at index i, eigenvariable *)
  (* branching rules *)
  | AndRight of int                 (** ∧R at index i → 2 branches *)
  | OrLeft of int                   (** ∨L at index i → 2 branches *)
  | ImpliesLeft of int              (** →L at index i → 2 branches *)
  (* Quantifier instantiation *)
  | ForallLeft of int * term        (** ∀L at index i, instantiate with t *)
  | ExistsRight of int * term       (** ∃R at index i, instantiate with t *)

(** Result of a proof search using LK' backward search. *)

type proof_result =
  | Proved of proof_tree
  | NotProved
  | Timeout

(** Proof tree for LK' derivations. *)
and proof_tree =
  | Axiom of rule * sequent
  | Inference of rule * sequent * proof_tree list

(* ================================================================ *)
(* LITERALS & CLAUSES (Engine 3 — Resolution)                        *)
(* ================================================================ *)

(** Literals for the resolution engine. A literal is either a positive
    or negative atomic predicate. *)

type literal =
  | Pos of string * term list       (** Positive: P(t1,...,tn) *)
  | Neg of string * term list       (** Negative: ¬P(t1,...,tn) *)

(** A clause is a disjunction of literals, represented as a list. *)
type clause = literal list

(* ================================================================ *)
(* SUBSTITUTIONS                                                     *)
(* ================================================================ *)

(** A substitution maps variable names to terms. *)
type substitution = (string * term) list

(* ================================================================ *)
(* RESOLUTION PROOF TRACE                                            *)
(* ================================================================ *)

(** A single step in a resolution refutation. *)
type resolution_step =
  | BinaryRes of {
      parent1 : clause;
      parent2 : clause;
      lit1    : literal;
      lit2    : literal;
      resolvent : clause;
    }
  | Factor of {
      parent : clause;
      lit1   : literal;
      lit2   : literal;
      result : clause;
    }

(** Result of the resolution engine. *)
type refutation_result =
  | Refuted of resolution_step list  (** Found empty clause — formula is valid *)
  | Saturated                        (** Clause set saturated — not provable *)
  | ResTimeout                       (** Exceeded time limit *)

(* ================================================================ *)
(* PROVER STATISTICS (shared)                                       *)
(* ================================================================ *)

(** Performance statistics collected during proof search.
    Used by the benchmark runner for all three engines. *)
type prover_stats = {
  mutable steps           : int;     (** Total rule applications *)
  mutable branches        : int;     (** Total branches explored *)
  mutable max_depth       : int;     (** Maximum proof tree depth *)
  mutable inst_attempts   : int;     (** ∀L/∃R instantiation attempts (Engines 1,2) *)
  mutable inst_hits       : int;     (** Unification-guided hits (Engine 2) *)
  mutable inst_wasted     : int;     (** Backtracked instantiations *)
  mutable clauses_gen     : int;     (** Clauses generated (Engine 3) *)
  mutable subsumptions    : int;     (** Subsumptions applied (Engine 3) *)
  mutable time_ms         : float;   (** Wall-clock time in milliseconds *)
}

(** Create fresh zeroed statistics record. *)
let make_stats () = {
  steps = 0; branches = 0; max_depth = 0;
  inst_attempts = 0; inst_hits = 0; inst_wasted = 0;
  clauses_gen = 0; subsumptions = 0; time_ms = 0.0;
}

(* ================================================================ *)
(* UNIFIED ENGINE RESULT                                             *)
(* ================================================================ *)

(** Engine identifier for the benchmark runner. *)
type engine =
  | Baseline
  | Improved
  | Resolution

(** Unified result type wrapping all engine results + stats. *)
type engine_result = {
  engine     : engine;
  solved     : bool;
  stats      : prover_stats;
}
