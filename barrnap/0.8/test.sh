#!/bin/bash
# This script is to test that the program Barrnap runs as expected

VERSION=$1

# Check version (from stderr)
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if [ "$(barrnap --version 2>&1)" == "barrnap $VERSION" ]; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  barrnap --version
  exit 1
fi

# Get data
wget -nv https://github.com/nf-core/test-datasets/raw/bactmap/genome/NCTC13799.fna

# Run tool to extract rRNA sequences
barrnap NCTC13799.fna > rrna.gff

# Verify output
FILE="rrna.gff"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "e943b08a2d8413274757fdded4a9a9006f76d39490d2117d276c0958416bb613" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
