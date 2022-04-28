#!/bin/bash
# This script is to test that the program BWA runs as expected

VERSION=$1

# Check version (from stderr)
samtools 2> version.txt
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if grep -q "Version: ${VERSION}" version.txt; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  samtools
  exit 1
fi

# Get data
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/genomics/sarscov2/genome/genome.fasta
wget -nv https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/illumina/bam/test.paired_end.bam

# Run program to sort and index an alignment

# Sort and compress alignment with options -l: high compress level for output
samtools sort \
    --reference genome.fasta \
    -l 9 \
    -o test.paired_end_sorted.bam \
    test.paired_end.bam

# Index the compressed alignment for fast random access
samtools index test.paired_end_sorted.bam test.paired_end_sorted.bam.bai

# Verify output
FILE="test.paired_end_sorted.bam.bai"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "15ace5e2ceff9a77322e3c42af762f1afe388dd2e91a8acfcf010bbe13f85260" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
