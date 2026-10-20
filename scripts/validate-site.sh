#!/usr/bin/env bash
set -euo pipefail

test -f index.html
test -s index.html
test -f dist/index.html
test -s dist/index.html
cmp -s index.html dist/index.html

grep -Fq '<!doctype html>' dist/index.html
grep -Fq '<meta name="viewport"' dist/index.html
grep -Fq '<title>' dist/index.html
grep -Fq '</html>' dist/index.html

if grep -nE 'href="(javascript:|#)"|src="(javascript:|#)"' dist/index.html; then
  echo "Invalid placeholder link found" >&2
  exit 1
fi

echo "Static site validation passed."
