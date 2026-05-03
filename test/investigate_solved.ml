(* test/investigate_solved.ml *)
open Atp_ocaml.Types

let read_lines filename =
  let lines = ref [] in
  let ch = open_in filename in
  try
    while true; do
      lines := input_line ch :: !lines
    done; !lines
  with End_of_file ->
    close_in ch;
    List.rev !lines

let run () =
  let lines = read_lines "test/random_benchmark.txt" in
  Printf.printf "Investigating %d random problems for solved cases...\n%!" (List.length lines);
  
  List.iter (fun line ->
    try
      let parts = String.split_on_char '|' line in
      let id = List.nth parts 0 in
      let f_str = List.nth parts 2 in
      let lexbuf = Lexing.from_string f_str in
      let problem = Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf in
      
      let res_b = Atp_ocaml.Baseline.prove problem 2000. in
      if res_b.solved then
        Printf.printf "SOLVED (Baseline)  | ID %s | %s\n%!" id f_str;

      let res_imp = Atp_ocaml.Improved.prove problem 2000. in
      if res_imp.solved && not res_b.solved then
        Printf.printf "SOLVED (Improved)  | ID %s | %s\n%!" id f_str;

      let res_r = Atp_ocaml.Resolution.prove problem 2000. in
      if res_r.solved && not res_b.solved && not res_imp.solved then
        Printf.printf "SOLVED (Resolution)| ID %s | %s\n%!" id f_str;

    with _ -> ()
  ) lines;
  Printf.printf "Investigation complete.\n%!"

let () = run ()
