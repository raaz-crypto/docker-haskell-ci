Ubuntu container for haskell
----------------------------

This repository contains the Dockerfile for an ubuntu container with
the following additional installations

1. HVR's ppa is enabled, see <https://github.com/hvr/multi-ghc-travis>

2. [Haskell Stack][stack] is installed.

This docker image was created mainly to use a docker based CI like
http://shippable.com with a convenient haskell environment is
required.

[stack]: <https://docs.haskellstack.org/> "The Haskell Stack"
