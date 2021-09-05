#!/usr/bin/env bash
#
# This script assumes a linux environment

DES=$1/assets

printf "*** Packaging assets in $DES... "

rm -rf $DES
mkdir $DES

cp ./assets/assets.json $DES/

if [ -n "${TRAVIS_TAG}" ]; then
  pushd .. > /dev/null
  git clone --depth 1 https://github.com/ntnguyen1234/nuAssets.git
  popd > /dev/null
fi

mkdir $DES/thirdparties
cp -R ../nuAssets/thirdparties/hosts-file.net             $DES/thirdparties/
cp -R ../nuAssets/thirdparties/mirror1.malwaredomains.com $DES/thirdparties/
cp -R ../nuAssets/thirdparties/pgl.yoyo.org               $DES/thirdparties/
cp -R ../nuAssets/thirdparties/publicsuffix.org           $DES/thirdparties/
cp -R ../nuAssets/thirdparties/someonewhocares.org        $DES/thirdparties/
cp -R ../nuAssets/thirdparties/winhelp2002.mvps.org       $DES/thirdparties/
cp -R ../nuAssets/thirdparties/www.malwaredomainlist.com  $DES/thirdparties/
mkdir $DES/umatrix
cp -R ../nuAssets/recipes/*                               $DES/umatrix/

echo "done."
