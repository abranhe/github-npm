#!/usr/bin/env bash

if ([ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ])
  then
    echo "please specify one of (major, minor, patch)"
    exit
fi

git checkout master
npm install
npm version $1
VERSION=`cat package.json | version`
git add .
git commit -m 'New Release'
git push origin master
git push origin --tags
npm publish
