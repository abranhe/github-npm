#!/usr/bin/env bash

if ([ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ])
  then
    echo "please specify one of (major, minor, patch)"
    exit
fi

git checkout master
git add .
npm install
npm version $1
# Version key/value should be on his own line
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')
echo $PACKAGE_VERSION
git add .
git commit -m "$PACKAGE_VERSION published"
git push origin master
npm publish
git tag -a $PACKAGE_VERSION -m  "$PACKAGE_VERSION published"
git push origin --tags
