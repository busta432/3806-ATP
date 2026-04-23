(** test_parser.ml — Tests for the FOL parser. *)

open Atp_ocaml.Printer

let parse_formula s =
  let lexbuf = Lexing.from_string s in
  Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf

let check_parse msg s expected_ascii =
  let f = parse_formula s in
  Alcotest.(check string) msg expected_ascii (pp_formula_ascii f)

(* ================================================================ *)
(* BASIC PARSING                                                     *)
(* ================================================================ *)

let test_parse_basic () =
  check_parse "proposition" "P" "P";
  check_parse "predicate" "P(x, f(y))" "P(x, f(y))";
  check_parse "not" "~P" "~P";
  check_parse "and" "P /\\ Q" "P /\\ Q";
  check_parse "or" "P \\/ Q" "P \\/ Q";
  check_parse "implies" "P -> Q" "P => Q";  (* Printer uses => for implies *)
  check_parse "iff" "P <-> Q" "P <=> Q"   (* Printer uses <=> for iff *)

let test_parse_unicode () =
  check_parse "unicode and" "P ∧ Q" "P /\\ Q";
  check_parse "unicode or" "P ∨ Q" "P \\/ Q";
  check_parse "unicode not" "¬P" "~P";
  check_parse "unicode implies" "P → Q" "P => Q";
  check_parse "unicode forall" "∀x. P(x)" "forall x. P(x)"

let test_parse_precedence () =
  (* ~P /\ Q \/ R -> S should be (((~P) /\ Q) \/ R) -> S *)
  check_parse "precedence 1" "~P /\\ Q \\/ R -> S" "~P /\\ Q \\/ R => S";
  (* parens to override *)
  check_parse "parens" "~(P /\\ Q)" "~(P /\\ Q)"

let test_parse_quantifiers () =
  check_parse "forall" "forall x. P(x)" "forall x. P(x)";
  check_parse "exists" "exists x. P(x)" "exists x. P(x)";
  check_parse "nested" "forall x. exists y. P(x, y)" "forall x. exists y. P(x, y)";
  check_parse "quant body" "forall x. P(x) -> Q(x)" "forall x. P(x) => Q(x)"

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Parser" [
    "basic", [
      Alcotest.test_case "basic" `Quick test_parse_basic;
      Alcotest.test_case "unicode" `Quick test_parse_unicode;
    ];
    "precedence", [
      Alcotest.test_case "complex" `Quick test_parse_precedence;
    ];
    "quantifiers", [
      Alcotest.test_case "quantifiers" `Quick test_parse_quantifiers;
    ];
  ]
