(** indexing.ml — Fingerprint indexing for formula retrieval.
    
    Provides a way to quickly retrieve formulas from a sequent that might 
    unify with a given literal. *)

open Types

module FingerprintIndex = struct
  type t = (string * int, formula list) Hashtbl.t

  let create () : t = Hashtbl.create 16

  let insert (index : t) (f : formula) =
    match f with
    | Pred (p, args) ->
        let key = (p, List.length args) in
        let existing = try Hashtbl.find index key with Not_found -> [] in
        Hashtbl.replace index key (f :: existing)
    | _ -> ()

  let query (index : t) (f : formula) : formula list =
    match f with
    | Pred (p, args) ->
        let key = (p, List.length args) in
        (try Hashtbl.find index key with Not_found -> [])
    | _ -> []

  let from_list (formulas : formula list) : t =
    let index = create () in
    List.iter (insert index) formulas;
    index
end
