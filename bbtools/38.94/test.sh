#!/bin/bash
# This script is to test that the program BBTools runs as expected

VERSION=$1

# Check version (from stderr)
bbduk.sh --version 2> version.txt
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if grep -q "BBMap version ${VERSION}" version.txt; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  bbduk.sh --version
  exit 1
fi

# Get data
wget -nv https://github.com/nf-core/test-datasets/raw/mag/test_data/test_minigut_R1.fastq.gz -O R1.fastq.gz
wget -nv https://github.com/nf-core/test-datasets/raw/mag/test_data/test_minigut_R2.fastq.gz -O R2.fastq.gz

# Use PhiX reference genome that comes packaged with with tool
PHIX="/bbmap/resources/phix174_ill.ref.fa.gz"

# Run tool to filter out PhiX reads
# Note: memory calculation is broken, correctly cacluates 85% of memory but formats incorrectly, resulting in e.g. "Invalid maximum heap size: -Xmx-166m"
bbduk.sh \
  -Xmx166m \
  k=31 \
  hdist=1 \
  ref="$PHIX" \
  in=R1.fastq.gz \
  in2=R2.fastq.gz \
  out=R1_filtered.fastq \
  out2=R2_filtered.fastq \
  qin=auto \
  qout=33

# Verify output
FILE="R1_filtered.fastq"
cat $FILE | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" | sha256sum > ${FILE}_sorted_sha256sum  # Sort and generate checksum
if grep -q "d29a612ced8380129aab8f9be51f981cb5a7b958879ae6f77cf1c40377d79f73" ${FILE}_sorted_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sorted_sha256sum
  exit 1
fi
