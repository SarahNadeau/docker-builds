#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs Prokka to annotate an assembly.

I=/test_data
O=$I/annot
O2=$I/ssu
mkdir -p $O
mkdir -p $O2

B=SRR5481494_sub

echo "Running Prokka on test data to annotate an assembly"
prokka \
  --outdir $O/"$B" \
  --prefix "$B" \
  --force \
  --addgenes \
  --locustag "$B" \
  --mincontiglen 1 \
  --evalue 1e-08 \
  --centre X \
  --compliant \
  $I/asm/"$B".fasta

sha256sum "$O/$B/$B".gff > "$O/$B/$B".gff.checksum