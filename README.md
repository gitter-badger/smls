
#### \*\* WORKING IN PROGRESS \*\* DOESN'T WORK YET.


====



Selfhosting Musl Linux Sysroot/Scripts
=========


SMLS is automated build scripts for building a selfhosting musl linux. It downloads the source, building, and creating a tar achirve the built root, ideal for Docker.



Build
=====

### ***IMPORTANT***
This script may **_permanently damage your system_**. It is _strongly recommanded_ that you run this in a dedicated virtualmachine or use docker (See With Docker for details).

Clone
------
```sh
$ git clone https://github.com/omeid/smls;    # clone the repo scripts.
$ cd smls                                     # Enter SMLS
```

Configure
-------------

###### Dependencies
You need to install the dependencies, run the `./01-prepare/01-systemcheck` to see if you have all the requirments.
>   TODO: This step can automated by making `./01-prepare/01-systemcheck` fail when a Requirements is missing or old. Can you help out? send us a pull request!


There is only one optional environment variables `BUILDROOT` that defaults to `/tmp/buildroot` which you may change.
That is.


Run!
--------
As stated above, setting the `BUILDROOT` is optional.
```sh
$ BUILDROOT=/path/to/build/root/ ./build.sh   # Build!
```

With Docker
==========
Coming soon...




How it works?
=============
Read the source code luke!



=====


Credits
=======
This project wouldn't have been possible without [CLFS Projec](http://cross-lfs.org) and the following authors who wrote the [CFLS Embedded Book](http://cross-lfs.org/view/clfs-embedded/x86/).

  - Andrew Bradford
  - Joe Ciccone
  - Jim Gifford
  - Maarten Lankhorst
  - Ryan Oliver

And a special thanks to Andrew Bradford for writing the musl gcc patch.
