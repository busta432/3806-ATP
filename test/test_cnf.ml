(** test_cnf.ml — Tests for the CNF conversion pipeline. *)

open Atp_ocaml.Types

open Atp_ocaml.Printer
open Atp_ocaml.Cnf

let parse_formula s =
  let lexbuf = Lexing.from_string s in
  Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf

let string_of_literal = function
  | Pos (p, args) -> pp_formula (Pred (p, args))
  | Neg (p, args) -> pp_formula (Not (Pred (p, args)))

let string_of_clause c =
  "{" ^ String.concat ", " (List.map string_of_literal c) ^ "}"

let check_cnf msg s expected_clauses =
  let f = parse_formula s in
  let clauses = to_clauses f in
  let clauses_str = String.concat "; " (List.map string_of_clause clauses) in
  Printf.printf "  [TEST] %s: %s -> %s\n" msg s clauses_str;
  (* Basic count check for now, can be expanded to content check *)
  Alcotest.(check int) msg expected_clauses (List.length clauses)

let test_nnf () =
  let f = parse_formula "~~P" in
  let n = nnf f in
  Alcotest.(check string) "double neg" "P" (pp_formula n);
  let f2 = parse_formula "~(P /\\ Q)" in
  let n2 = nnf f2 in
  Alcotest.(check string) "de morgan" "¬P ∨ ¬Q" (pp_formula n2)

let test_full_pipeline () =
  check_cnf "prop" "P /\\ (Q \\/ R)" 2;
  check_cnf "distrib" "(P /\\ Q) \\/ R" 2;
  check_cnf "syllogism_neg" "~((forall x. M(x) -> P(x)) /\ M(s) -> P(s))" 3

let () =
  Alcotest.run "CNF" [
    "nnf", [
      Alcotest.test_case "basic" `Quick test_nnf;
    ];
    "pipeline", [
      Alcotest.test_case "to_clauses" `Quick test_full_pipeline;
    ];
  ]
