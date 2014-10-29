
#### \*\* WORKING IN PROGRESS \*\* DOESN'T WORK YET.


====



Selfhosting Musl Linux Sysroot/Scripts 
======================


SMLS is automated build scripts for building a selfhosting musl linux. It
downloads the sources, builds, and creates a tar achirve the of built sysroot,
ideal for building Docker images.



#### Build 

#### ***IMPORTANT*** 
This script may **_permanently damage your system_**. It is _strongly recommanded_ that you run this in a dedicated virtualmachine or use
docker (See With Docker for details).

##### Clone 

```sh 
$ git clone https://github.com/omeid/smls;    # clone the repo scripts.  
$ cd smls                                     # Enter SMLS 
```

##### Configure

###### Dependencies 

You need to install the build dependencies, run the `./01-prepare/01-systemcheck` to see if you have all the requirments.
>   TODO: This step can automated by making `./01-prepare/01-systemcheck` fail when a Requirements is missing or old.  
>   Can you help out? send us a pull request!


There is only one optional environment variables `BUILDROOT` that defaults to `/tmp/buildroot` which you may change.  

That is it.


##### Go! 

```sh 
$ ./build   # Builds all stages in /tmp/buildroot (default $BUILDROOT).
```

or you can optionally pass any stage that you want to build, and only those stages will be built. 
```sh
$ ./build  01-prepare  # Pre the system only.
$ # You can then run 02-temporary 03-sysroot without internet.
$ ./build 02-prepare 03-sysroot
```

### With Docker 

> Note: This is a temporary setup for debugging. It won't give you a smls based image just yet. 

Build the docker image, and start a container
```sh
$ docker build -t smls-master github.com/omeid/smls &&
$ docker -i -t --name smls-master-debug run smls-master sh
```

You should be in the in container now, so run the second part of build:
```sh
sh-4.2$  /tmp/smls-master/build 02-temporary 03-sysroot
```


## How Does it works? 
Read The Source, Luke!



=====


### License 

Copyright (c) <2014> by omeid <public@omeid.me>. 

This material may be distributed only subject to the terms and conditions 
set forth in the [Open Publication License, v1.0](LICENSE) or [later](http://www.opencontent.org/openpub/).


### Credits & Contributors

This work is based on original work at [CLFS Embedded](http://cross-lfs.org/view/clfs-embedded) by
- Andrew Bradford
- Joe Ciccone
- Jim Gifford
- Maarten Lankhorst
- Ryan Oliver

A special thanks to Andrew Bradford for writing the musl gcc patch.
