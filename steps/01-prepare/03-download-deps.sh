#!bin/sh

# A helper function to use with tar and curl.
decompress() { 
  case $1 in 
    *.gz) 
      gzip -d;; 

    *.bz2) 
      bzip2 -d;; 

    *) 
      cat ;; 
  esac; 
}



deps_list=(\
   "http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2" 
   "http://ftp.gnu.org/gnu/make/make-4.1.tar.bz2"

   "http://ftp.gnu.org/gnu/gcc/gcc-4.7.3/gcc-4.7.3.tar.bz2"
   "http://ftp.gnu.org/gnu/gmp/gmp-5.1.2.tar.bz2"
   "http://ftp.gnu.org/gnu/mpc/mpc-1.0.1.tar.gz"
   "http://ftp.gnu.org/gnu/mpfr/mpfr-3.1.2.tar.bz2"

   "http://www.musl-libc.org/releases/musl-1.1.5.tar.gz" 
);


# Create the dependencies directory.
mkdir -p "$DEPS"

# Make sure it is clean.
rm -rf $DEPS/*

for dep in "${deps_list[@]}"; do

  # Download and extract the dependency
  curl -L -o - "$dep" | decompress "$dep" | tar xf - -C "$DEPS"

  #Trim the url to package name.
  dep="${dep##*/}"; dep="${dep%%.tar*}";

  # Strip the version from product.
  mv "$DEPS/$dep" "$DEPS/${dep%%-*}"

done
