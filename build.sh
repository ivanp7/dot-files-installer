#!/bin/sh

cd -- "$(dirname -- "$0")"

cp -f PKGBUILD.template ../PKGBUILD
cp -f dot-files.install.template ../dot-files.install
cp -f .pkg_prepare.sh.template ../.pkg_prepare.sh

cd ..

: ${PACKAGE_POSTFIX:="$(git -C . rev-parse --abbrev-ref HEAD 2> /dev/null)"}
: ${PACKAGE_POSTFIX:="custom"}

sed -i "s,_____,$(cat dependencies),g" PKGBUILD
sed -i "s:@@@@@:$PACKAGE_POSTFIX:g" PKGBUILD
sed -i "s:@@@@@:$PACKAGE_POSTFIX:g" dot-files.install
sed -i "s:@@@@@:$PACKAGE_POSTFIX:g" .pkg_prepare.sh

makepkg -Cf

