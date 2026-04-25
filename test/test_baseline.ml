(** test_baseline.ml — Tests for the Baseline Prover (Engine 1). *)

open Atp_ocaml.Types
open Atp_ocaml.Baseline

let parse_formula s =
  let lexbuf = Lexing.from_string s in
  Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf

let check_prove msg s expected =
  let f = parse_formula s in
  let result = prove f 5000. in (* 5 second timeout *)
  Alcotest.(check bool) msg expected result.solved;
  if result.solved then
    Printf.printf "  [DONE] %s solved in %d steps, %d instantiations, %.2f ms\n"
      msg result.stats.steps result.stats.inst_attempts result.stats.time_ms

(* ================================================================ *)
(* PROPOSITIONAL TESTS                                               *)
(* ================================================================ *)

let test_prop_basic () =
  check_prove "identity" "P -> P" true;
  check_prove "and_elim" "P /\\ Q -> P" true;
  check_prove "or_intro" "P -> P \\/ Q" true;
  check_prove "double_neg" "~~P -> P" true

let test_prop_complex () =
  check_prove "peirce_law" "((P -> Q) -> P) -> P" true;
  check_prove "distributive" "P /\\ (Q \\/ R) <-> (P /\\ Q) \\/ (P /\\ R)" true;
  check_prove "excluded_middle" "P \\/ ~P" true;
  check_prove "de_morgan" "~(P /\\ Q) <-> ~P \\/ ~Q" true

(* ================================================================ *)
(* FIRST-ORDER TESTS                                                 *)
(* ================================================================ *)

let test_fol_basic () =
  check_prove "forall_elim" "(forall x. P(x)) -> P(a)" true;
  check_prove "exists_intro" "P(a) -> exists x. P(x)" true;
  check_prove "forall_dist" "(forall x. P(x) /\\ Q(x)) <-> (forall x. P(x)) /\\ (forall x. Q(x))" true

let test_fol_classic () =
  (* Drinker's Paradox: exists x. (P(x) -> forall y. P(y)) *)
  check_prove "drinker_paradox" "exists x. (P(x) -> forall y. P(y))" true;
  (* Basic syllogism *)
  check_prove "syllogism" "(forall x. M(x) -> P(x)) /\\ M(s) -> P(s)" true

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Baseline" [
    "propositional", [
      Alcotest.test_case "basic" `Quick test_prop_basic;
      Alcotest.test_case "complex" `Quick test_prop_complex;
    ];
    "fol", [
      Alcotest.test_case "basic" `Quick test_fol_basic;
      Alcotest.test_case "classic" `Quick test_fol_classic;
    ];
  ]
