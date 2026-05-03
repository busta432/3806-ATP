(** test_resolution.ml — Tests for the Resolution Engine (Engine 3). *)

open Atp_ocaml.Types
open Atp_ocaml.Resolution

let parse_formula s =
  let lexbuf = Lexing.from_string s in
  Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf

let check_prove msg s expected =
  let f = parse_formula s in
  let result = prove f 5000. in (* 5 second timeout *)
  Alcotest.(check bool) msg expected result.solved;
  if result.solved then
    Printf.printf "  [DONE] %s solved in %d steps, %.2f ms\n"
      msg result.stats.steps result.stats.time_ms

(* ================================================================ *)
(* PROPOSITIONAL RESOLUTION                                          *)
(* ================================================================ *)

let test_prop_resolution () =
  check_prove "identity" "P -> P" true;
  check_prove "excluded_middle" "P \\/ ~P" true;
  check_prove "modus_ponens" "(P -> Q) /\\ P -> Q" true;
  check_prove "transitivity" "(P -> Q) /\\ (Q -> R) -> (P -> R)" true;
  check_prove "peirce" "((P -> Q) -> P) -> P" true

(* ================================================================ *)
(* FIRST-ORDER RESOLUTION                                            *)
(* ================================================================ *)

let test_fol_resolution () =
  check_prove "syllogism" "(forall x. M(x) -> P(x)) /\\ M(s) -> P(s)" true;
  check_prove "drinker" "exists x. P(x) -> forall y. P(y)" true;
  check_prove "distrib" "(forall x. P(x) /\\ Q(x)) <-> (forall x. P(x)) /\\ (forall x. Q(x))" true;
  check_prove "exists_and" "(exists x. P(x) \\/ Q(x)) <-> (exists x. P(x)) \\/ (exists x. Q(x))" true;
  
  (* Monadic Predicate Problems *)
  check_prove "P18" "exists y. forall x. P(y) -> P(x)" true;
  check_prove "P19" "exists x. forall y. forall z. (P(y) -> Q(z)) -> (P(x) -> Q(x))" true

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Resolution Engine" [
    "propositional", [
      Alcotest.test_case "basic" `Quick test_prop_resolution;
    ];
    "fol", [
      Alcotest.test_case "basic" `Quick test_fol_resolution;
    ];
  ]
