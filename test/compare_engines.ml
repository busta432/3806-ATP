(* test/compare_engines.ml *)
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
  let base_solved = ref [] in
  let res_solved = ref [] in
  
  List.iter (fun line ->
    try
      let parts = String.split_on_char '|' line in
      let id = List.nth parts 0 in
      let lexbuf = Lexing.from_string (List.nth parts 2) in
      let problem = Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf in
      
      let res_b = Atp_ocaml.Baseline.prove problem 500. in
      if res_b.solved then base_solved := id :: !base_solved;

      let res_r = Atp_ocaml.Resolution.prove problem 500. in
      if res_r.solved then res_solved := id :: !res_solved;
    with _ -> ()
  ) lines;
  
  let b_set = List.sort (fun a b -> compare (int_of_string a) (int_of_string b)) !base_solved in
  let r_set = List.sort (fun a b -> compare (int_of_string a) (int_of_string b)) !res_solved in
  
  Printf.printf "Baseline solved %d: %s\n" (List.length b_set) (String.concat ", " b_set);
  Printf.printf "Resolution solved %d: %s\n" (List.length r_set) (String.concat ", " r_set);
  
  if b_set = r_set then
    Printf.printf "SUCCESS: Both engines solved exactly the same problems.\n"
  else
    Printf.printf "DIFFERENCE: Engines solved different problems.\n"

let () = run ()
