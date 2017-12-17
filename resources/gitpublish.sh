#!/bin/sh -e

# This script maintains a git branch which mirrors master but in a form that
# what will eventually be deployed to npm, allowing npm dependencies to use:
#
#     "graphql": "git://github.com/graphql/graphql-js.git#npm"
#

npm run build
cp README.md dist/
cp LICENSE dist/
cd dist
git init
git config user.name "Travis CI"
git config user.email "github@fb.com"
git add .
git commit -m "Deploy master to NPM branch"
git push --force --quiet "https://${GH_TOKEN}@github.com/graphql/graphql-js.git" master:npm
