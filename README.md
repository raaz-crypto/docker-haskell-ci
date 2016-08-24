Ubuntu container for haskell
----------------------------

This repository contains the Dockerfile for an ubuntu container with
the following additional installations

1. HVR's ppa is enabled, see <https://github.com/hvr/multi-ghc-travis>

2. [Haskell Stack][stack] is installed.

This docker image was created mainly for use in a docker based CI like
http://shippable.com. It sets up a convenient haskell environment
where we have the haskell stack installed. If need be, any of the
multiple versions of ghc and cabal-install supported by hvr's
repository can be installed.


[stack]: <https://docs.haskellstack.org/> "The Haskell Stack"
