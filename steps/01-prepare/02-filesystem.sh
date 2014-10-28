#bin/sh

mkdir -p  "$BUILDROOT/cross-tools/$TARGET"
ln -sfv . "$BUILDROOT/cross-tools/$TARGET/usr"
