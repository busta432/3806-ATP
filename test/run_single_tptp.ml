(* test/run_single_tptp.ml *)
open Atp_ocaml.Types

let read_whole_file filename =
  let ch = open_in filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let build_problem decls =
  let axioms = List.filter_map (function
    | Fof (_, role, f) when role = "axiom" || role = "hypothesis" || role = "definition" || role = "lemma" || role = "theorem" -> Some f
    | _ -> None
  ) decls in
  let conjectures = List.filter_map (function
    | Fof (_, role, f) when role = "conjecture" || role = "negated_conjecture" -> Some f
    | _ -> None
  ) decls in
  let conjecture = match conjectures with
    | [] -> Atp_ocaml.Types.Top
    | [c] -> c
    | c::cs -> List.fold_left (fun acc f -> And(acc, f)) c cs
  in
  match axioms with
  | [] -> conjecture
  | a::as_ ->
      let premise = List.fold_left (fun acc f -> And(acc, f)) a as_ in
      Implies (premise, conjecture)

let run_test filename =
  Printf.printf "Evaluating problem: %s\n" filename;
  try
    let content = read_whole_file filename in
    let lexbuf = Lexing.from_string content in
    let decls = Atp_ocaml.Tptp_parser.tptp_file Atp_ocaml.Tptp_lexer.tokenize lexbuf in
    let problem = build_problem decls in
    
    let engines = [
      ("Baseline", Atp_ocaml.Baseline.prove);
      ("Improved", Atp_ocaml.Improved.prove);
      ("Resolution", Atp_ocaml.Resolution.prove)
    ] in
    
    List.iter (fun (name, prove) ->
      Printf.printf "\n--- Engine: %s ---\n" name;
      let result = prove problem 10000. in (* 10s timeout *)
      if result.solved then (
        Printf.printf "Result: PROVED!\n";
        Printf.printf "Steps: %d\n" result.stats.steps;
        Printf.printf "Time: %.2f ms\n" result.stats.time_ms
      ) else (
        Printf.printf "Result: FAILED (Timeout or no proof found)\n";
        Printf.printf "Time elapsed: %.2f ms\n" result.stats.time_ms
      )
    ) engines
  with e ->
    Printf.printf "Error processing file: %s\n" (Printexc.to_string e)

let () =
  let target = "test/PUZ133+1.p" in
  run_test target
