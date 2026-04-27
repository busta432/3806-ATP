(** resolution.ml — ENGINE 3: Resolution Refutation Prover.
    
    Implements a first-order resolution prover using the Otter loop
    (given-clause algorithm) with binary resolution, factoring, and
    subsumption.
    
    References:
    - Robinson (1965), "A Machine-Oriented Logic Based on the Resolution Principle".
    - McCune (2003), "Otter 3.3 Reference Manual".
    - Harrison (2009), "Handbook of Practical Logic", Chapter 4. *)

open Types
open Formula
open Unification

(* ================================================================ *)
(* UTILITIES                                                         *)
(* ================================================================ *)

(** Rename variables in a clause to avoid collisions during resolution.
    Appends a suffix like "_1" or "_2". *)
let rename_clause suffix clause =
  let rename_term = let rec aux = function
    | Var x -> Var (x ^ suffix)
    | Func (f, args) -> Func (f, List.map aux args)
    in aux
  in
  let rename_lit = function
    | Pos (p, args) -> Pos (p, List.map rename_term args)
    | Neg (p, args) -> Neg (p, List.map rename_term args)
  in
  List.map rename_lit clause

(** Check if a clause is a tautology (contains P and ¬P). *)
let is_tautology clause =
  List.exists (fun l1 ->
    match l1 with
    | Pos (p, args1) ->
      List.exists (function Neg (q, args2) -> p = q && args1 = args2 | _ -> false) clause
    | Neg (p, args1) ->
      List.exists (function Pos (q, args2) -> p = q && args1 = args2 | _ -> false) clause
  ) clause

(** Remove duplicate literals from a clause. *)
let simplify_clause clause =
  unique clause

(* ================================================================ *)
(* SUBSUMPTION                                                       *)
(* ================================================================ *)

(** Check if clause c1 subsumes c2.
    c1 subsumes c2 if there exists a substitution σ such that σ(c1) ⊆ c2. *)
let subsumes c1 c2 =
  let rec search sigma = function
    | [] -> true
    | l1 :: rest ->
      (* Try to find a literal in c2 that l1 can unify with *)
      let rec try_l2s = function
        | [] -> false
        | l2 :: l2s ->
          (match unify_literals sigma l1 l2 with
           | Some sigma' -> if search sigma' rest then true else try_l2s l2s
           | None -> try_l2s l2s)
      in
      try_l2s c2
  in
  if List.length c1 > List.length c2 then false
  else search [] c1

(* ================================================================ *)
(* RESOLUTION & FACTORING                                            *)
(* = *)

(** Perform binary resolution on two clauses.
    Returns a list of all possible resolvents. *)
let resolve c1 c2 =
  let c1' = rename_clause "_L" c1 in
  let c2' = rename_clause "_R" c2 in
  let res = ref [] in
  List.iter (fun l1 ->
    List.iter (fun l2 ->
      match unify_complementary [] l1 l2 with
      | Some sigma ->
        let r = List.filter (fun l -> l <> l1) c1' @ List.filter (fun l -> l <> l2) c2' in
        res := (simplify_clause (apply_clause sigma r)) :: !res
      | None -> ()
    ) c2'
  ) c1';
  !res

(** Perform factoring on a clause.
    Returns a list of all possible factors. *)
let factor clause =
  let res = ref [] in
  let rec aux = function
    | [] -> ()
    | l1 :: rest ->
      List.iter (fun l2 ->
        if l1 <> l2 then
          match unify_literals [] l1 l2 with
          | Some sigma ->
            res := (simplify_clause (apply_clause sigma clause)) :: !res
          | None -> ()
      ) rest;
      aux rest
  in
  aux clause;
  !res

(* ================================================================ *)
(* OTTER LOOP (GIVEN-CLAUSE ALGORITHM)                               *)
(* ================================================================ *)

let prove formula timeout_ms =
  let start_time = Unix.gettimeofday () in
  let stats = make_stats () in
  
  (* 1. Preprocessing: Negate -> CNF *)
  let clauses = Cnf.to_clauses (Not formula) in
  let unprocessed = ref (List.filter (fun c -> not (is_tautology c)) clauses) in
  let processed = ref [] in
  
  stats.clauses_gen <- List.length !unprocessed;

  let rec loop () =
    let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
    if elapsed > timeout_ms then
      { engine = Resolution; solved = false; stats = { stats with time_ms = elapsed } }
    else if !unprocessed = [] then
      { engine = Resolution; solved = false; stats = { stats with time_ms = elapsed } }
    else
      (* Select "given clause": pick the smallest for heuristic *)
      let given = 
        let sorted = List.sort (fun c1 c2 -> compare (List.length c1) (List.length c2)) !unprocessed in
        List.hd sorted
      in
      unprocessed := List.filter (fun c -> c != given) !unprocessed;
      
      if given = [] then (
        stats.time_ms <- (Unix.gettimeofday () -. start_time) *. 1000.;
        { engine = Resolution; solved = true; stats }
      ) else if List.exists (fun p -> subsumes p given) !processed then
        loop () (* Forward subsumption *)
      else (
        stats.steps <- stats.steps + 1;
        
        (* Backward subsumption: remove clauses in processed subsumed by given *)
        let old_processed_count = List.length !processed in
        processed := List.filter (fun p -> not (subsumes given p)) !processed;
        stats.subsumptions <- stats.subsumptions + (old_processed_count - List.length !processed);
        
        (* Generate new resolvents *)
        let new_resolvents = List.concat_map (resolve given) !processed in
        (* Generate factors *)
        let new_factors = factor given in
        let newborns = new_resolvents @ new_factors in
        
        stats.clauses_gen <- stats.clauses_gen + List.length newborns;
        
        let any_empty = ref false in
        List.iter (fun r ->
          if r = [] then any_empty := true
          else if not (is_tautology r) && 
                  not (List.exists (fun p -> subsumes p r) !processed) &&
                  not (List.exists (fun u -> subsumes u r) !unprocessed) then
            unprocessed := r :: !unprocessed
        ) newborns;
        
        processed := given :: !processed;
        
        if !any_empty then (
          stats.time_ms <- (Unix.gettimeofday () -. start_time) *. 1000.;
          { engine = Resolution; solved = true; stats }
        ) else loop ()
      )
  in
  loop ()
