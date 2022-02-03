#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs QUAST to generate QC stats on an assembly.

I=/test_data
O=$I/qa
mkdir -p $O

B=SRR5481494_sub

echo "Running QUAST on test data to QC an assembly"
quast.py \
  --output-dir $O \
  --min-contig 100 \
  --no-html \
  --gene-finding \
  --gene-thresholds 300 \
  --contig-thresholds 500,1000 \
  --ambiguity-usage one \
  --strict-NA \
  $I/asm/$B.fasta

sha256sum "$O"/report.txt > "$O"/report.txt.checksum