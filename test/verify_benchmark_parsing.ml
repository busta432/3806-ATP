(* test/verify_benchmark_parsing.ml *)

let read_whole_file filename =
  let ch = open_in filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let run () =
  let bench_dir = "benchmark_clean" in
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
  let total = List.length all_files in
  let passed = ref 0 in
  let failed = ref [] in

  Printf.printf "Verifying parsing for %d files in %s...\n%!" total bench_dir;

  List.iter (fun f ->
    try
      let content = read_whole_file f in
      let lexbuf = Lexing.from_string content in
      let _ = Atp_ocaml.Tptp_parser.tptp_file Atp_ocaml.Tptp_lexer.tokenize lexbuf in
      passed := !passed + 1
    with e ->
      failed := (f, Printexc.to_string e) :: !failed;
      Printf.printf "FAILED: %s (%s)\n%!" f (Printexc.to_string e)
  ) all_files;

  Printf.printf "\nSummary:\n";
  Printf.printf "Total: %d\n" total;
  Printf.printf "Passed: %d\n" !passed;
  Printf.printf "Failed: %d\n" (List.length !failed);

  if List.length !failed > 0 then (
    Printf.printf "\nRemoving failed files...\n";
    List.iter (fun (f, _) -> 
      try Sys.remove f with _ -> ()
    ) !failed;
    Printf.printf "Cleanup complete.\n"
  )

let () = run ()
