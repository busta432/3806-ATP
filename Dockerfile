# ATP-OCaml Development Environment
# Based on official OCaml/opam image with all required tools

FROM ocaml/opam:debian-12-ocaml-5.2 AS dev

# Install system dependencies
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    pkg-config \
    m4 \
    && sudo rm -rf /var/lib/apt/lists/*

# Install OCaml build tools and libraries
RUN opam install -y \
    dune \
    menhir \
    menhirLib \
    alcotest \
    cmdliner \
    yojson \
    && opam clean -a -c -r

WORKDIR /home/opam/app

# Copy project files
COPY --chown=opam:opam . .

# Default command: interactive shell with opam env
CMD ["bash", "-c", "eval $(opam env) && exec bash"]
