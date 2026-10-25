#!/usr/bin/env bash
set -euo pipefail

rm -rf dist
mkdir -p dist
cp index.html dist/index.html
cp -R writing dist/writing
test -s dist/index.html
