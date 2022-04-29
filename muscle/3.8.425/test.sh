#!/bin/bash
# This script is to test that the program NCBI blast+ runs as expected

VERSION=$1

# Check version (from stderr)
VERSION=${VERSION:="no version set"}  # ensure output doesn't match empty value if unset
if [ "$(muscle -version 2>&1)" == "MUSCLE v$VERSION by Robert C. Edgar" ]; then
  echo "Correct version"
else
  echo "Version was unexpected:"
  muscle -version
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
muscle \
  -in genomes.fna \
  -out genomes.fna.aln

# Get alignment on one line, sort the entries, and generate checksum
# Adapted from: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/ and https://www.biostars.org/p/9262/
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < genomes.fna.aln \
  | tail -n +2 \
  | paste - - | sort -k1,1 -t " " | tr "\t" "\n" > genomes_sorted.fna.aln

# Verify output
FILE="genomes_sorted.fna.aln"
sha256sum $FILE > ${FILE}_sha256sum  # generate checksum
if grep -q "1eaf98c8edda786becc0c2eede2caa2df164db29ce27cc1e8ebd9672e73c2d9a" ${FILE}_sha256sum ; then  # verify checksum
  echo "Correct output"
else
  echo "Output $FILE didn't match expected checksum."
  cat ${FILE}_sha256sum
  exit 1
fi
