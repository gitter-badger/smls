
#### \*\* WORKING IN PROGRESS \*\* DOESN'T WORK YET.


---



Selfhosting Musl Linux Sysroot/Scripts
=========


smls is automated build scripts for building a selfhosting musl linux based on the first host architcture. It downloads the sources and dependencies, building, and creating a tar achirve the built root, ideal for Docker.



Build
=====

### ***IMPORTANT***
This script may permanently damage your system. It is **_strongly_  recommanded** that you run this in a dedicated virtualmachine or use docker.


Configuration
-------------
There is only one optional environment variables `BUILDROOT` that defaults to `/tmp/buildroot` which you may change.
That is.


Building
Clone, and run the build.
--------
```sh
~ $ git clone https://github.com/omeid/smls; cd smls # clone the repo scripts.
~/smls $ BUILDROOT=/path/to/build/root/ ./build.sh   # And viola! it starts building.

```

With Docker
----------
Coming soon...




How it works?
=============
Read the source code luke!



---


Credits
=======
This project wouldn't have been possible without [CLFS Projec](http://cross-lfs.org) and the following authors who wrote the [CFLS Embedded Book](http://cross-lfs.org/view/clfs-embedded/x86/).

  - Andrew Bradford
  - Joe Ciccone
  - Jim Gifford
  - Maarten Lankhorst
  - Ryan Oliver
  - 
