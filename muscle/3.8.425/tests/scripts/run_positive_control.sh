#!/bin/bash
# This script runs MUSCLE to generate an alignment from a test FastA file.

I=/tests/files
O=/tests/muscle_output
mkdir -p $O

B=test

echo "Running MUSCLE on test data to do nucleotide sequence alignment"
muscle \
  -in "$I"/$B.fasta \
  -out "$O"/$B.fas.aln \
  -maxiters 50 \
  -maxhours 0.1

# Get alignment on one line, sort the entries, and generate checksum
# Adapted from: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/ and https://www.biostars.org/p/9262/
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < test_v3.fas.aln \
  | tail -n +2 \
  | paste - - | sort -k1,1 -t " " | tr "\t" "\n" \
  | sha256sum > "$O"/$B.fas.aln.checksum
