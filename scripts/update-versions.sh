#!/bin/sh

version=$(npm view ./ version)
p=$(pwd)
echo "Updating version to $version"

cd projects/react/dist/lib/ && jq ".version=\"$version\"" package.json >package.json.tmp && cp package.json.tmp package.json && rm package.json.tmp
cd "$p" || exit 1
cd projects/core/dist/lib/ && jq ".version=\"$version\"" package.json >package.json.tmp && cp package.json.tmp package.json && rm package.json.tmp
cd "$p" || exit 1
cd projects/angular/dist/lib/ && jq ".version=\"$version\"" package.json >package.json.tmp && cp package.json.tmp package.json && rm package.json.tmp
cd "$p" || exit 1
