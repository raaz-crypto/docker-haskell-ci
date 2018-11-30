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

# Install some basic packages that are required by the haskell
# environment.
RUN sudo apt-get install git curl wget hlint tar gzip bash "ghc-$GHCVER" "cabal-install-$CABALVER" -y
RUN echo export PATH=/opt/ghc/$GHCVER/bin:/opt/cabal/$CABALVER/bin:$PATH > $HOME/.bash_profile
