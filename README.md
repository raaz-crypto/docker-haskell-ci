Ubuntu container for haskell
----------------------------

This repository contains the Dockerfile for an ubuntu container with
the following additional installations

1. HVR's ppa is enabled, see <https://github.com/hvr/multi-ghc-travis>

2. [Haskell Stack][stack] is installed.


This docker image is suitable for use in CI setting where a haskell
environment is required.

[stack]: <https://docs.haskellstack.org/> "The Haskell Stack"
