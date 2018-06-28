#!/usr/bin/env bash

if ([ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ])
  then
    echo "please specify one of (major, minor, patch)"
    exit
fi
#
git checkout master
# npm install
# npm version $1
# git add .
#
# git commit -m "$PACKAGE_VERSION published"
# git push origin master
# npm publish
# git tag -a $PACKAGE_VERSION -m  "$PACKAGE_VERSION published"
# git push origin --tags
git clean -ndx
npm version $1
