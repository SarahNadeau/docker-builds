#!/bin/bash
# This script is to test that the program Gubbins runs as expected

VERSION=$1

# Check version
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if [ "$(run_gubbins.py --version)" == "$VERSION" ]; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  run_gubbins.py --version
  exit 1
fi

# Get data
wget -nv https://raw.githubusercontent.com/rpetit3/test-datasets/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.nwk
wget -nv https://github.com/rpetit3/test-datasets/raw/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.gz
gunzip genome.aln.gz

# Run tool to infer recombination from alignment
run_gubbins.py \
  --starting-tree genome.aln.nwk \
  --prefix test \
    genome.aln

# Run tool to mask recombination positions in alignment
mask_gubbins_aln.py \
  --aln genome.aln \
  --gff test.recombination_predictions.gff \
  --out genome_masked.aln

# Verify output
FILE="test.recombination_predictions.gff"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "78fae4b7dc6d1e3b6277d3574ede6bc762f07b4c4fc2d3d4a0948086528eb2d9" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
