FROM ocaml/opam:debian-ocaml-4.07

RUN sudo apt install --assume-yes python3-pip
RUN pip3 install --user pynput evdev

RUN sudo apt install --assume-yes m4
RUN opam init
RUN opam switch 4.07
RUN opam install dune core lwt re color sexp_pretty
RUN opam install lwt_ppx notty

COPY --chown=opam . /workdir
WORKDIR /workdir

RUN eval $(opam env) && dune build
RUN eval $(opam env) && dune install

ENTRYPOINT /home/opam/.opam/4.07/bin/flitter
