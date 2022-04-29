#!/bin/bash
# This script is to test that the program ClonalFrameML runs as expected

VERSION=$1

# Check version
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if [ "$(ClonalFrameML -version)" == "ClonalFrameML v$VERSION" ]; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  ClonalFrameML -version
  exit 1
fi

# Get data
wget -nv https://raw.githubusercontent.com/rpetit3/test-datasets/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.nwk
wget -nv https://github.com/rpetit3/test-datasets/raw/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.gz
gunzip genome.aln.gz

# Run tool to infer recombination from alignment
ClonalFrameML \
  genome.aln.nwk \
  genome.aln \
  test \
  -output_filtered true

# Run tool to generate PDF output
Rscript /ClonalFrameML/src/cfml_results.R test

# Verify output
FILE="test.importation_status.txt"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "9e4457623aa8e00ade67c05c8c4f9d5bc73117e77bc2f2e9482eaf29d8f99754" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
