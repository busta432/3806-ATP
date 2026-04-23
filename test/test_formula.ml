(** test_formula.ml — Tests for formula manipulation operations. *)

open Atp_ocaml.Types
open Atp_ocaml.Formula
open Atp_ocaml.Printer

(* Helper to check formula equality via pretty-printing *)
let check_formula msg expected f =
  Alcotest.(check string) msg expected (pp_formula f)

(* ================================================================ *)
(* FREE VARIABLES                                                    *)
(* ================================================================ *)

let test_free_vars_pred () =
  let f = Pred ("P", [Var "x"; Var "y"]) in
  let fv = free_vars_unique f in
  Alcotest.(check (list string)) "pred free vars" ["x"; "y"] fv

let test_free_vars_forall () =
  (* forall x. P(x, y) — y is free, x is bound *)
  let f = Forall ("x", Pred ("P", [Var "x"; Var "y"])) in
  let fv = free_vars_unique f in
  Alcotest.(check (list string)) "forall binds x" ["y"] fv

let test_free_vars_nested () =
  (* forall x. exists y. P(x, y, z) — z is free *)
  let f = Forall ("x", Exists ("y", Pred ("P", [Var "x"; Var "y"; Var "z"]))) in
  let fv = free_vars_unique f in
  Alcotest.(check (list string)) "nested quantifiers" ["z"] fv

let test_free_vars_shadow () =
  (* forall x. (P(x) /\ exists x. Q(x)) — no free vars *)
  let f = Forall ("x", And (Pred ("P", [Var "x"]),
                            Exists ("x", Pred ("Q", [Var "x"])))) in
  let fv = free_vars_unique f in
  Alcotest.(check (list string)) "shadowed" [] fv

(* ================================================================ *)
(* SUBSTITUTION                                                      *)
(* ================================================================ *)

let test_subst_var () =
  let f = Pred ("P", [Var "x"]) in
  let result = subst [("x", Func ("a", []))] f in
  check_formula "subst var" "P(a)" result

let test_subst_capture_avoid () =
  (* subst [y -> x] in forall x. P(x, y) should rename bound x *)
  let f = Forall ("x", Pred ("P", [Var "x"; Var "y"])) in
  let result = subst [("y", Var "x")] f in
  (* The bound x should be renamed to avoid capture *)
  let fv = free_vars_unique result in
  Alcotest.(check bool) "x is free after subst" true (List.mem "x" fv);
  Alcotest.(check bool) "y is not free after subst" false (List.mem "y" fv)

let test_subst_no_change () =
  (* subst [z -> a] in P(x) — z doesn't occur *)
  let f = Pred ("P", [Var "x"]) in
  let result = subst [("z", Func ("a", []))] f in
  check_formula "no change" "P(x)" result

(* ================================================================ *)
(* SIMPLIFICATION                                                    *)
(* ================================================================ *)

let test_simplify_top_and () =
  check_formula "⊤ ∧ P" "P" (simplify (And (Top, Pred ("P", []))))

let test_simplify_bot_and () =
  check_formula "⊥ ∧ P" "⊥" (simplify (And (Bot, Pred ("P", []))))

let test_simplify_bot_or () =
  check_formula "⊥ ∨ P" "P" (simplify (Or (Bot, Pred ("P", []))))

let test_simplify_top_or () =
  check_formula "⊤ ∨ P" "⊤" (simplify (Or (Top, Pred ("P", []))))

let test_simplify_double_neg () =
  check_formula "¬¬P" "P" (simplify (Not (Not (Pred ("P", [])))))

let test_simplify_implies_top () =
  check_formula "⊤ → P" "P" (simplify (Implies (Top, Pred ("P", []))))

let test_simplify_implies_bot () =
  check_formula "⊥ → P" "⊤" (simplify (Implies (Bot, Pred ("P", []))))

(* ================================================================ *)
(* NNF                                                               *)
(* ================================================================ *)

let test_nnf_implies () =
  (* P -> Q becomes ¬P ∨ Q *)
  let f = Implies (Pred ("P", []), Pred ("Q", [])) in
  check_formula "nnf implies" "¬P ∨ Q" (nnf f)

let test_nnf_de_morgan_and () =
  (* ¬(P ∧ Q) becomes ¬P ∨ ¬Q *)
  let f = Not (And (Pred ("P", []), Pred ("Q", []))) in
  check_formula "nnf de morgan and" "¬P ∨ ¬Q" (nnf f)

let test_nnf_de_morgan_or () =
  (* ¬(P ∨ Q) becomes ¬P ∧ ¬Q *)
  let f = Not (Or (Pred ("P", []), Pred ("Q", []))) in
  check_formula "nnf de morgan or" "¬P ∧ ¬Q" (nnf f)

let test_nnf_forall_neg () =
  (* ¬∀x. P(x) becomes ∃x. ¬P(x) *)
  let f = Not (Forall ("x", Pred ("P", [Var "x"]))) in
  check_formula "nnf not forall" "∃x. ¬P(x)" (nnf f)

let test_nnf_double_neg () =
  let f = Not (Not (Pred ("P", []))) in
  check_formula "nnf double neg" "P" (nnf f)

(* ================================================================ *)
(* SKOLEMIZATION                                                     *)
(* ================================================================ *)

let test_skolemize_simple () =
  reset_skolem ();
  (* ∃x. P(x) becomes P(sk1) *)
  let f = Exists ("x", Pred ("P", [Var "x"])) in
  let result = skolemize (nnf f) in
  check_formula "skolem simple" "P(sk1)" result

let test_skolemize_dependent () =
  reset_skolem ();
  (* ∀y. ∃x. P(x, y) becomes ∀y. P(sk1(y), y) *)
  let f = Forall ("y", Exists ("x", Pred ("P", [Var "x"; Var "y"]))) in
  let result = skolemize (nnf f) in
  check_formula "skolem dependent" "∀y. P(sk1(y), y)" result

(* ================================================================ *)
(* CNF CONVERSION                                                    *)
(* ================================================================ *)

let test_cnf_simple () =
  reset_skolem ();
  (* P -> Q becomes {¬P, Q} — one clause *)
  let f = Implies (Pred ("P", []), Pred ("Q", [])) in
  let clauses = formula_to_cnf f in
  Alcotest.(check int) "one clause" 1 (List.length clauses);
  Alcotest.(check int) "two literals" 2 (List.length (List.hd clauses))

let test_cnf_conjunction () =
  reset_skolem ();
  (* P /\ Q becomes {P}, {Q} — two unit clauses *)
  let f = And (Pred ("P", []), Pred ("Q", [])) in
  let clauses = formula_to_cnf f in
  Alcotest.(check int) "two clauses" 2 (List.length clauses)

(* ================================================================ *)
(* UTILITY                                                           *)
(* ================================================================ *)

let test_constants_of () =
  let f = Pred ("P", [Func ("a", []); Func ("f", [Var "x"])]) in
  let cs = constants_of f in
  Alcotest.(check (list string)) "constants" ["a"] cs

let test_variant () =
  Alcotest.(check string) "no clash" "x" (variant "x" ["y"; "z"]);
  Alcotest.(check string) "clash" "x'" (variant "x" ["x"; "y"])

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Formula" [
    "free_vars", [
      Alcotest.test_case "pred" `Quick test_free_vars_pred;
      Alcotest.test_case "forall" `Quick test_free_vars_forall;
      Alcotest.test_case "nested" `Quick test_free_vars_nested;
      Alcotest.test_case "shadow" `Quick test_free_vars_shadow;
    ];
    "substitution", [
      Alcotest.test_case "basic" `Quick test_subst_var;
      Alcotest.test_case "capture avoid" `Quick test_subst_capture_avoid;
      Alcotest.test_case "no change" `Quick test_subst_no_change;
    ];
    "simplify", [
      Alcotest.test_case "⊤ ∧ P" `Quick test_simplify_top_and;
      Alcotest.test_case "⊥ ∧ P" `Quick test_simplify_bot_and;
      Alcotest.test_case "⊥ ∨ P" `Quick test_simplify_bot_or;
      Alcotest.test_case "⊤ ∨ P" `Quick test_simplify_top_or;
      Alcotest.test_case "¬¬P" `Quick test_simplify_double_neg;
      Alcotest.test_case "⊤ → P" `Quick test_simplify_implies_top;
      Alcotest.test_case "⊥ → P" `Quick test_simplify_implies_bot;
    ];
    "nnf", [
      Alcotest.test_case "implies" `Quick test_nnf_implies;
      Alcotest.test_case "de morgan and" `Quick test_nnf_de_morgan_and;
      Alcotest.test_case "de morgan or" `Quick test_nnf_de_morgan_or;
      Alcotest.test_case "not forall" `Quick test_nnf_forall_neg;
      Alcotest.test_case "double neg" `Quick test_nnf_double_neg;
    ];
    "skolemize", [
      Alcotest.test_case "simple" `Quick test_skolemize_simple;
      Alcotest.test_case "dependent" `Quick test_skolemize_dependent;
    ];
    "cnf", [
      Alcotest.test_case "implication" `Quick test_cnf_simple;
      Alcotest.test_case "conjunction" `Quick test_cnf_conjunction;
    ];
    "utility", [
      Alcotest.test_case "constants_of" `Quick test_constants_of;
      Alcotest.test_case "variant" `Quick test_variant;
    ];
  ]
