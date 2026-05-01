(** test_engines.ml — Evaluation of all three engines on a 20-problem suite. *)

open Atp_ocaml.Types

let parse_formula s =
  let lexbuf = Lexing.from_string s in
  Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf

let suite = [
    (* Valid (16) *)
    ({|(forall x. R(x)) -> R(A)|}, true);
    ({|R(A) -> exists x. R(x)|}, true);
    ({|~(forall x. R(x)) -> exists x. ~R(x)|}, true);
    ({|(forall x. (R(x) -> S(x))) -> ((forall x. R(x)) -> (forall x. S(x)))|}, true);
    ({|(exists x. forall y. R(x,y)) -> (forall y. exists x. R(x,y))|}, true);
    ({|(forall x. (R(x) -> S(x))) -> ((exists x. R(x)) -> (exists x. S(x)))|}, true);
    ({|forall x. (R(x) -> R(x))|}, true);
    ({|(forall x. R(x)) -> (exists x. R(x))|}, true);
    ({|(forall x. R(x) /\ forall x. S(x)) -> forall x. (R(x) /\ S(x))|}, true);
    ({|(forall x. R(F(x))) -> (exists y. R(y))|}, true);
    ({|P -> Q <-> (~Q -> ~P)|}, true);
    ({|~~P <-> P|}, true);
    ({|exists y. forall x. P(y) -> P(x)|}, true);
    ({|(forall x. (P <-> Q(x))) -> (P <-> (forall x. Q(x)))|}, true);
    ({|(exists x. exists y. R(x,y)) -> (exists y. exists x. R(x,y))|}, true);
    ({|(forall x. R(x)) -> ((forall x. S(x)) -> (forall x. (R(x) /\ S(x))))|}, true);
    (* Invalid (4) *)
    ({|(exists x. R(x)) -> (forall x. R(x))|}, false);
    ({|(forall x. exists y. R(x,y)) -> (exists y. forall x. R(x,y))|}, false);
    ({|R(F(A)) -> R(A)|}, false);
    ({|(exists x. (R(x) -> S(x))) -> ((exists x. R(x)) -> (exists x. S(x)))|}, false)
]

type eval_stats = {
  mutable acc_solved : int;
  mutable acc_time_ms : float;
  mutable acc_steps : int;
  mutable acc_max_depth : int;
  mutable acc_inst_attempts : int;
  mutable acc_inst_hits : int;
  mutable acc_inst_wasted : int;
  mutable acc_clauses_gen : int;
  mutable acc_subsumptions : int;
}

let make_results () = {
  acc_solved = 0; acc_time_ms = 0.0; acc_steps = 0; acc_max_depth = 0;
  acc_inst_attempts = 0; acc_inst_hits = 0; acc_inst_wasted = 0;
  acc_clauses_gen = 0; acc_subsumptions = 0;
}

let run_eval () =
  let engines = [
    ("Baseline", (fun f -> Atp_ocaml.Baseline.prove f 2000.));
    ("Improved", (fun f -> Atp_ocaml.Improved.prove f 2000.));
    ("Resolution", (fun f -> Atp_ocaml.Resolution.prove f 2000.))
  ] in
  
  let stats_map = List.map (fun (name, _) -> (name, make_results ())) engines in
  
  Printf.printf "Running OCaml Evaluation on %d problems...\n\n" (List.length suite);
  
  List.iteri (fun _i (f_str, expected) ->
    let f = parse_formula f_str in
    List.iter (fun (name, prove_fn) ->
      let res = prove_fn f in
      let r = List.assoc name stats_map in
      if res.solved = expected then r.acc_solved <- r.acc_solved + 1;
      
      r.acc_time_ms <- r.acc_time_ms +. res.stats.time_ms;
      r.acc_steps <- r.acc_steps + res.stats.steps;
      r.acc_max_depth <- max r.acc_max_depth res.stats.max_depth;
      r.acc_inst_attempts <- r.acc_inst_attempts + res.stats.inst_attempts;
      r.acc_inst_hits <- r.acc_inst_hits + res.stats.inst_hits;
      r.acc_inst_wasted <- r.acc_inst_wasted + res.stats.inst_wasted;
      r.acc_clauses_gen <- r.acc_clauses_gen + res.stats.clauses_gen;
      r.acc_subsumptions <- r.acc_subsumptions + res.stats.subsumptions;
    ) engines
  ) suite;
  
  Printf.printf "%-12s | %-7s | %-8s | %-6s | %-5s | %-7s | %-8s | %-7s | %-7s | %-7s\n"
    "Engine" "Solve %" "Time(s)" "Steps" "Depth" "InstAtt" "InstHit%" "InstWst" "ClsGen" "Subsump";
  Printf.printf "%s\n" (String.make 110 '-');
  
  List.iter (fun (name, r) ->
    let solve_rate = (float_of_int r.acc_solved /. float_of_int (List.length suite)) *. 100. in
    let hit_rate = if r.acc_inst_attempts = 0 then 0.0 else (float_of_int r.acc_inst_hits /. float_of_int r.acc_inst_attempts) *. 100. in
    
    let inst_att = if name = "Resolution" then "N/A" else string_of_int r.acc_inst_attempts in
    let inst_hit = if name = "Resolution" then "N/A" else Printf.sprintf "%.1f%%" hit_rate in
    let inst_wst = if name = "Resolution" then "N/A" else string_of_int r.acc_inst_wasted in
    let cls_gen = if name <> "Resolution" then "N/A" else string_of_int r.acc_clauses_gen in
    let subs = if name <> "Resolution" then "N/A" else string_of_int r.acc_subsumptions in

    Printf.printf "%-12s | %6.1f%% | %8.3f | %6d | %5d | %7s | %8s | %7s | %7s | %7s\n"
      name solve_rate (r.acc_time_ms /. 1000.0) r.acc_steps r.acc_max_depth inst_att inst_hit inst_wst cls_gen subs
  ) stats_map

let () = run_eval ()
