#!/bin/bash


# Setup
set -e
umask 022

# Where are the scripts?
build_scripts_path="$(dirname $(readlink -f "$0"))"

export BUILDROOT=${BUILDROOT:-/tmp/buildroot}

# Running the first step, warn if buildroot already exists.
[ -d $BUILDROOT ] && [ "${1%%-*}" == "01" ] && >&2 echo "WARNNING: BUILDROOT already exists."

export LOGS="$BUILDROOT/logs"
export SRC="$BUILDROOT/src"
export DEPS="$SRC/deps"
export PATCHDIR="$build_scripts_path/patches"

export JOBS="-j$(grep "^core id" /proc/cpuinfo | sort -u | wc -l)"
export LC_ALL=POSIX
export CC=${CC:-gcc}
export CXX=${CXX:-g++}
export HOST="$($CC -dumpmachine)"
export TARGET="$(printf $HOST | sed -e 's/-[^-]*/-musl/')"

export PATH="${BUILDROOT}/cross-tools/bin:$PATH"

export ROOTFS="${BUILDROOT}/rootfs"

# Prepare the step(s).
if [ -z "$1" ]
then
  echo "Building all stages." >&2
fi

steps=${1:-*}
build_steps="$build_scripts_path/steps"


runstep() {
  for script in $1/*
  do
    mkdir -p $BUILDROOT/work $LOGS
    cd $BUILDROOT/work
    echo Running $script
    . $script > "$LOGS/$(basename $script)";
    cd $BUILDROOT
    rm -rf $BUILDROOT/work
    hash -r
  done
}

for step in $build_steps/$steps
do
  runstep "$step" 
done
