#!/bin/bash
# This script is to test that the program FigTree runs as expected

VERSION=$1

# Check version
figtree --version > version.txt
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if grep -q "FigTree v$VERSION" version.txt; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  figtree --version
  exit 1
fi

# Get data
echo "(GCF_000292685:0.0000009427,(GCF_000298385:0.0003914987,(GCF_002849995:0.0025820788,GCF_902713755:0.1808976496)100:0.0016343704)100:0.0002269453,GCF_000300075:0.0000086193);
" > tree.nwk

# Run tool to visualize a phylogeny
figtree \
  -graphic PDF \
  tree.nwk \
  tree.pdf

figtree \
  -graphic PNG \
  tree.nwk \
  tree.png

# Verify output
FILE="tree.png"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "9442045e0af5e6cec3d665906286b14266a9e7e9f3505dd8747220afd2590151" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
