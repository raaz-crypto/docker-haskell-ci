FROM ubuntu:14.04
MAINTAINER Piyush P Kurur <ppk@cse.iitk.ac.in>

RUN sudo apt-get update -y
RUN sudo apt-get install software-properties-common -y

# We enable the repository of hvr so that we can access any of the
# many versions of ghc that he provides. See
# https://github.com/hvr/multi-ghc-travis

RUN sudo add-apt-repository -y ppa:hvr/ghc

# Now we install the appropriate version of stack as described in
# https://docs.haskellstack.org/en/stable/install_and_upgrade/#ubuntu

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442 # Get the fpcomplete keys
RUN echo 'deb http://download.fpcomplete.com/ubuntu trusty main'|sudo tee /etc/apt/sources.list.d/fpco.list

# Update apt- packages.

RUN sudo apt-get update
RUN sudo apt-get install stack -y  # Install Haskell stack.