#!/bin/bash
# This script is to test that the program DIAMOND runs as expected

VERSION=$1

# Check version
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if [ "$(diamond --version)" == "diamond version $VERSION" ]; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  diamond --version
  exit 1
fi

# Get data (query and reference protein sequences)
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/7639b3c2f9f8f5ef153598e09bb98b7aabcaea2c/general/fasta/msa/BBA0001.tfa -O query_proteins.fasta
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/proteomics/database/yeast_UPS.fasta -O reference_proteins.fasta

# Create diamond-formatted database file
diamond \
  makedb \
  --in reference_proteins.fasta \
  --db reference

# Run tool to find closest hits to sequence
diamond \
  blastp \
  --db reference \
  --query query_proteins.fasta \
  --out diamond.tsv

# Verify output
FILE="diamond.tsv"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "426cac3c58d7666fd13d94011fa15ff852404f6a200a55bf3254d80a7f04fe8a" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
