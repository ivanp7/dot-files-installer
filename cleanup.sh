#!/bin/sh

cd -- "$(dirname -- "$0")/.."

rm -f PKGBUILD
rm -f dot-files.install

rm -rf src
rm -rf pkg
rm -f *.pkg.tar.zst

