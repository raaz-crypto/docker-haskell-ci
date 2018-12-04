FROM ubuntu:14.04
MAINTAINER Piyush P Kurur <ppk@iitpkd.ac.in>

# Versions of some haskell packages to pre-install

# GHC Versions to install
ENV GHCVER   "8.4.1"
# cabal-install version
ENV CABALVER "2.2"
ENV OPAMVER "1.2.2"
ENV COQVER "8.6.1"

RUN sudo apt-get update -y
RUN sudo apt-get install software-properties-common -y

# Generate the locales.

RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# We enable the repository of hvr so that we can access any of the
# many versions of ghc that he provides. See
# https://github.com/hvr/multi-ghc-travis

RUN sudo add-apt-repository -y ppa:hvr/ghc

# Anil Madhavapeddy repository for ocaml, opam and related stuff.

RUN sudo add-apt-repository -y ppa:avsm/ppa

# Update apt- packages.

RUN sudo apt-get update -y

# Install some basic packages

RUN sudo apt-get install -y git curl wget hlint tar gzip bash make

# Haskell related stuff

RUN sudo apt-get install -y "ghc-$GHCVER" "cabal-install-$CABALVER"
RUN echo export PATH=/opt/ghc/$GHCVER/bin:/opt/cabal/$CABALVER/bin:$PATH > $HOME/.bash_profile

# Coq and friends.

RUN sudo apt-get install opam m4 -y
RUN opam
RUN opam init -y
RUN opam repo add coq-released https://coq.inria.fr/opam/released
RUN opam update -y
RUN opam switch set 4.05.0 -y
RUN opam install coq."$COQVER" -y --verbose
RUN opam pin add coq "$COQVER" -y
RUN opam install coq-color -y --verbose


# Setting up repositories.

ENV PATH  "/opt/ghc/$GHCVER/bin:/opt/cabal/$CABALVER/bin:$PATH"
RUN cabal update
WORKDIR /root
RUN git clone --recursive https://github.com/raaz-crypto/raaz.git
RUN git clone https://github.com/raaz-crypto/verse-coq.git

# Building and running the raaz benchmarks.

WORKDIR /root/raaz
RUN cabal new-configure --flags=-linux-getrandom --flags=native
RUN cabal new-bench

WORKDIR /root/verse-coq/
RUN eval $(opam config env) && ./configure.sh
WORKDIR /root/verse-coq/crypto-lib
RUN eval $(opam config env) && make
