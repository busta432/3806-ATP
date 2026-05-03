open Atp_ocaml.Types

let test_swap_fallacy () =
  (* (∀x ∃y G(x,y)) → (∃y ∀x G(x,y)) *)
  let f_str = "(forall x. exists y. G(x,y)) -> (exists y. forall x. G(x,y))" in
  let lexbuf = Lexing.from_string f_str in
  let problem = Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf in
  Printf.printf "Testing Swap Fallacy (Soundness): %s\n" f_str;
  let res = Atp_ocaml.Improved.prove problem 2000. in
  if res.solved then
    Printf.printf "FAIL: Improved proved an invalid formula (Swap Fallacy)!\n"
  else
    Printf.printf "SUCCESS: Improved correctly failed to prove the fallacy.\n"

let test_termination_loop () =
  (* ∀x (P(x) → P(f(x))) -> P(a) - should fail and terminate *)
  let f_str = "(forall x. P(x) -> P(f(x))) -> P(a)" in
  let lexbuf = Lexing.from_string f_str in
  let problem = Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf in
  Printf.printf "Testing Termination (Regularity): %s\n" f_str;
  let res = Atp_ocaml.Improved.prove problem 2000. in
  if res.solved then
    Printf.printf "FAIL: Improved proved a non-theorem!\n"
  else
    Printf.printf "SUCCESS: Improved correctly failed and terminated.\n"

let () =
  test_swap_fallacy ();
  print_newline ();
  test_termination_loop ()
