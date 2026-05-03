(* test/debug_subset.ml *)
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

let is_propositional f =
  let rec aux = function
    | Top | Bot | Pred _ -> true
    | Not a -> aux a
    | And (a, b) | Or (a, b) | Implies (a, b) | Iff (a, b) -> aux a && aux b
    | Forall _ | Exists _ -> false
  in aux f

let run () =
  let bench_dir = "benchmark" in
  let rec get_files dir =
    if not (Sys.is_directory dir) then [] else
    let items = Sys.readdir dir |> Array.to_list in
    List.fold_left (fun acc item ->
      let path = Filename.concat dir item in
      if Sys.is_directory path then acc @ (get_files path)
      else if Filename.check_suffix path ".p" then path :: acc
      else acc
    ) [] items
  in
  let all_files = get_files bench_dir in
  let fol_problems = ref [] in
  List.iter (fun f ->
    try
      let content = read_whole_file f in
      let lexbuf = Lexing.from_string content in
      let decls = Atp_ocaml.Tptp_parser.tptp_file Atp_ocaml.Tptp_lexer.tokenize lexbuf in
      let has_include = List.exists (function Include _ -> true | _ -> false) decls in
      if not has_include then (
        let problem = build_problem decls in
        if not (is_propositional problem) then
          fol_problems := (f, problem) :: !fol_problems
      )
    with _ -> ()
  ) all_files;

  let subset = List.filteri (fun i _ -> i < 50) !fol_problems in
  
  Printf.printf "%-35s | Base | Imp | Res\n" "Problem File";
  Printf.printf "%s\n" (String.make 55 '-');
  
  List.iter (fun (f, problem) ->
    let res_b = Atp_ocaml.Baseline.prove problem 1000. in
    let res_i = Atp_ocaml.Improved.prove problem 1000. in
    let res_r = Atp_ocaml.Resolution.prove problem 1000. in
    Printf.printf "%-35s |  %s   |  %s  |  %s\n" 
      (Filename.basename f)
      (if res_b.solved then "X" else " ")
      (if res_i.solved then "X" else " ")
      (if res_r.solved then "X" else " ")
  ) subset

let () = run ()
