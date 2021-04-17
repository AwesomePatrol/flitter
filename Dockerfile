FROM ocaml/opam2:ubuntu

RUN sudo apt install --assume-yes python3-pip
RUN pip3 install --user pynput

RUN sudo apt install --assume-yes m4
RUN opam init
RUN opam switch 4.07
RUN opam install dune core lwt re color sexp_pretty
RUN opam install lwt_ppx notty

WORKDIR /workdir
