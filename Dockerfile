FROM ubuntu:14.04
MAINTAINER Piyush P Kurur <ppk@cse.iitk.ac.in>

RUN sudo apt-get update -y
RUN sudo apt-get install software-properties-common -y

# We enable the repository of hvr so that we can access any of the
# many versions of ghc that he provides. See
# https://github.com/hvr/multi-ghc-travis

RUN sudo add-apt-repository -y ppa:hvr/ghc

# We enable the fpcomplete repository for haskell stack.
# The appropriate version of stack as described in
# https://docs.haskellstack.org/en/stable/install_and_upgrade/#ubuntu

# Add keys of fpcomplete.
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
                     --recv-keys 575159689BEFB442

# Add their repository to the source list.
RUN echo 'deb http://download.fpcomplete.com/ubuntu trusty main' \
  | sudo tee /etc/apt/sources.list.d/fpco.list

# Update apt- packages.
RUN sudo apt-get update -y

# Install haskell some basic packages that are required by the haskell
# environment.
RUN sudo apt-get install curl wget hlint -y

# Install haskell stack.
RUN sudo apt-get install stack -y
