Trying out Raaz and Verse
=========================

If you want to get a feel of raaz and verse, and do not want to worry
too much about the many moving parts involved in it you can try out
the following docker instance. This instance exposes an Ubuntu 14.04
image with the following additional PPAs.

1. [Herbert Valerio Riedel's PPA][hvr-ppa] for managing various
   versions of ghc and cabal-install,

2. [Anil Madhavapeddy's PPA][avsm-ppa] for coq, ocaml, opam and
   related stuff.

It sets up an environment for haskell and coq that is useful to build
these libraries and try out stuff. You can also use this docker image
to trigger a CI system like http://shippable.com.

How to use it?
--------------


1. Setup docker for your platform

2. The docker image for this repository is available via the docker
   hub. Pull the image

	```
	$ docker pull raazcrypto/docker-haskell-ci
	```

3. Alternatively you can choose to build the docker image using the
   Dockerfile available here in this repository.

   ```
   $ docker build -t docker-haskell-ci .
   ```

4. Get yourself a shell inside the container.

	```
	$ docker run -t -i docker-haskell-ci bash -l
	```

Now you have an environment where you can build both the raaz library
and the verse.

[hvr-ppa]: <https://launchpad.net/~hvr/>
[avsm-ppa]:<https://launchpad.net/~avsm>
