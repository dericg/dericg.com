#!/usr/bin/env bash
set -euo pipefail

# Build the homepage and writing section for Cloudflare Pages.
rm -rf dist
mkdir -p dist
cp index.html dist/index.html
cp -R writing dist/writing
test -s dist/index.html
