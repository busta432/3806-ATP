ATP-OCaml: Automated Theorem Prover for First-Order Logic

  An automated theorem prover (ATP) for first-order logic (FOL) implemented in OCaml,
  with initial prototyping in Python. 

We first implement a naive algorithm provided (Algorithm 2) we then aim to build optimised proving engines, including optimised LK' backward search and resolution refutation.

  Project Structure

  This repository contains both the prototyping environment (Python) to and a 'high-performance' implementation in OCaml. This experience in OCaml will be my first experience with functional programming and will be heavily assist by John Harrison textbook - Handbook of Practical Logic and Automated Reasoning for referencing OCaml implementation.

   - python/: Prototyping and quick scripting. Used for architectural experiments and verifying logic transformations (e.g., parsing and core logic operations).
   - lib/: The core performance implementation in OCaml.
       - types.ml: Algebraic data types for terms, formulas, and sequents.
       - formula.ml: Logic manipulation (substitution, simplification, NNF).
       - printer.ml: Pretty-printing for FOL syntax.
       - parser.mly & lexer.mll: Core FOL parser using Menhir and ocamllex.
       - tptp_parser.mly & tptp_lexer.mll: Parser for industry-standard TPTP format.
   - test/: Debugging test suite for the OCaml implementation.
   - Research/: Academic references and papers that are heavily relied upon.

   Getting Started

  Prerequisites

   - OCaml (5.0 or later)
   - opam (OCaml package manager)
   - Python (for prototype scripts)

  Installation

   1 # Install OCaml dependencies
   2 opam install dune menhir alcotest cmdliner yojson
