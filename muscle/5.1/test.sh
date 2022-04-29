#!/bin/bash
# This script is to test that the program NCBI blast+ runs as expected

VERSION=$1

# Check version
muscle --version > version.txt
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if grep -q "muscle $VERSION.linux64" version.txt; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  muscle --version
  exit 1
fi

# Get data (SARS-CoV-2 whole-genome sequences)
wget -nv \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/858/895/GCF_009858895.2_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.fna.gz \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/011/537/615/GCA_011537615.1_ASM1153761v1/GCA_011537615.1_ASM1153761v1_genomic.fna.gz \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/011/537/705/GCA_011537705.1_ASM1153770v1/GCA_011537705.1_ASM1153770v1_genomic.fna.gz
gunzip *.gz
cat *.fna >> genomes.fna

# Run tool to align nucleotide sequences
# TODO: fails with segfault on sars-cov-2 genomes, although works with tiny custom tests
muscle \
  -align genomes.fna \
  -output genomes.fna.aln

# Get alignment on one line, sort the entries, and generate checksum
# Adapted from: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/ and https://www.biostars.org/p/9262/
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < genome.fna.aln \
  | tail -n +2 \
  | paste - - | sort -k1,1 -t " " | tr "\t" "\n" > genomes_sorted.fna.aln

# Verify output
FILE="genomes_sorted.fna.aln"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
