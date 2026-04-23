(** test_types.ml — Tests for core data types and pretty-printing.
    
    Verifies type constructors, printing, and basic operations. *)

open Atp_ocaml.Types
open Atp_ocaml.Printer

(* ================================================================ *)
(* TERM TESTS                                                        *)
(* ================================================================ *)

let test_var () =
  let t = Var "x" in
  Alcotest.(check string) "variable prints" "x" (pp_term t)

let test_const () =
  let t = Func ("c", []) in
  Alcotest.(check string) "constant prints" "c" (pp_term t)

let test_func () =
  let t = Func ("f", [Var "x"; Func ("g", [Var "y"])]) in
  Alcotest.(check string) "function prints" "f(x, g(y))" (pp_term t)

(* ================================================================ *)
(* FORMULA TESTS                                                     *)
(* ================================================================ *)

let test_pred () =
  let f = Pred ("P", [Var "x"]) in
  Alcotest.(check string) "predicate" "P(x)" (pp_formula f)

let test_not () =
  let f = Not (Pred ("P", [])) in
  Alcotest.(check string) "negation" "¬P" (pp_formula f)

let test_and () =
  let f = And (Pred ("P", []), Pred ("Q", [])) in
  Alcotest.(check string) "conjunction" "P ∧ Q" (pp_formula f)

let test_or () =
  let f = Or (Pred ("P", []), Pred ("Q", [])) in
  Alcotest.(check string) "disjunction" "P ∨ Q" (pp_formula f)

let test_implies () =
  let f = Implies (Pred ("P", []), Pred ("Q", [])) in
  Alcotest.(check string) "implication" "P → Q" (pp_formula f)

let test_forall () =
  let f = Forall ("x", Pred ("P", [Var "x"])) in
  Alcotest.(check string) "universal" "∀x. P(x)" (pp_formula f)

let test_exists () =
  let f = Exists ("x", Pred ("P", [Var "x"])) in
  Alcotest.(check string) "existential" "∃x. P(x)" (pp_formula f)

let test_complex () =
  (* forall x. P(x) -> exists y. Q(x, y) *)
  let f = Forall ("x",
    Implies (
      Pred ("P", [Var "x"]),
      Exists ("y", Pred ("Q", [Var "x"; Var "y"])))) in
  Alcotest.(check string) "complex formula"
    "∀x. P(x) → ∃y. Q(x, y)"
    (pp_formula f)

let test_precedence () =
  (* P /\ Q \/ R should print without parens: P ∧ Q ∨ R *)
  let f = Or (And (Pred ("P", []), Pred ("Q", [])), Pred ("R", [])) in
  Alcotest.(check string) "precedence and/or"
    "P ∧ Q ∨ R"
    (pp_formula f)

(* ================================================================ *)
(* SEQUENT TESTS                                                     *)
(* ================================================================ *)

let test_sequent () =
  let s = { antecedent = [Pred ("P", [])]; succedent = [Pred ("Q", [])] } in
  Alcotest.(check string) "sequent" "P ⊢ Q" (pp_sequent s)

(* ================================================================ *)
(* LITERAL & CLAUSE TESTS                                            *)
(* ================================================================ *)

let test_pos_literal () =
  let l = Pos ("P", [Var "x"]) in
  Alcotest.(check string) "positive literal" "P(x)" (pp_literal l)

let test_neg_literal () =
  let l = Neg ("P", [Var "x"]) in
  Alcotest.(check string) "negative literal" "¬P(x)" (pp_literal l)

let test_empty_clause () =
  Alcotest.(check string) "empty clause" "□" (pp_clause [])

let test_clause () =
  let c = [Pos ("P", [Var "x"]); Neg ("Q", [Var "y"])] in
  Alcotest.(check string) "clause" "P(x) ∨ ¬Q(y)" (pp_clause c)

(* ================================================================ *)
(* STATS TESTS                                                       *)
(* ================================================================ *)

let test_make_stats () =
  let s = make_stats () in
  Alcotest.(check int) "initial steps" 0 s.steps;
  Alcotest.(check int) "initial branches" 0 s.branches;
  Alcotest.(check int) "initial depth" 0 s.max_depth

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Types" [
    "term", [
      Alcotest.test_case "variable" `Quick test_var;
      Alcotest.test_case "constant" `Quick test_const;
      Alcotest.test_case "function" `Quick test_func;
    ];
    "formula", [
      Alcotest.test_case "predicate" `Quick test_pred;
      Alcotest.test_case "not" `Quick test_not;
      Alcotest.test_case "and" `Quick test_and;
      Alcotest.test_case "or" `Quick test_or;
      Alcotest.test_case "implies" `Quick test_implies;
      Alcotest.test_case "forall" `Quick test_forall;
      Alcotest.test_case "exists" `Quick test_exists;
      Alcotest.test_case "complex" `Quick test_complex;
      Alcotest.test_case "precedence" `Quick test_precedence;
    ];
    "sequent", [
      Alcotest.test_case "basic" `Quick test_sequent;
    ];
    "literal_clause", [
      Alcotest.test_case "positive" `Quick test_pos_literal;
      Alcotest.test_case "negative" `Quick test_neg_literal;
      Alcotest.test_case "empty clause" `Quick test_empty_clause;
      Alcotest.test_case "clause" `Quick test_clause;
    ];
    "stats", [
      Alcotest.test_case "make_stats" `Quick test_make_stats;
    ];
  ]
