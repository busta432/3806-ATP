(lang dune 3.13)
(using menhir 3.0)

(name atp_ocaml)
(version 0.1.0)

(generate_opam_files true)

(source (github danielbusing/atp-ocaml))
(license MIT)
(authors "Daniel Busing")
(maintainers "Daniel Busing")

(package
 (name atp_ocaml)
 (synopsis "Automated Theorem Prover for First-Order Logic")
 (description
  "A three-engine automated theorem prover implementing LK' backward search (baseline + improved) and resolution refutation for first-order logic.")
 (depends
  (ocaml (>= 5.0))
  (dune (>= 3.13))
  (menhir (>= 20230608))
  (alcotest (>= 1.7.0))
  (cmdliner (>= 1.2.0))
  (yojson (>= 2.1.0))))
