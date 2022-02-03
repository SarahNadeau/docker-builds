#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs QUAST to generate QC stats on an assembly.

I=/test_data
O=$I/aln
mkdir -p $O

B=SRR5481494_sub
B_REF_NCBI_ANNOTATION=GCF_001997265.1_ASM199726v1_protein
REF_NCBI_ANNOTATION=$I/$B_REF_NCBI_ANNOTATION.faa
B_REF_PROKKA_ANNOTATION=GCF_001997265.1
REF_PROKKA_ANNOTATION=$I/$B_REF_PROKKA_ANNOTATION.faa

echo "Running DIAMOND on test data to do protein alignment 1"
diamond \
  makedb \
  --in $REF_NCBI_ANNOTATION \
  --db ref_db_ncbi_annotation

diamond \
  blastp \
  --db ref_db_ncbi_annotation \
  --query $I/annot/$B.faa \
  --max-hsps 1 \
  --max-target-seqs 1 \
  --out $O/diamond.$B,$B_REF_NCBI_ANNOTATION.tab \
  --outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp gaps

echo "Running DIAMOND on test data to do protein alignment 2"
diamond \
  makedb \
  --in $REF_PROKKA_ANNOTATION \
  --db ref_db_prokka_annotation

diamond \
  blastp \
  --db ref_db_prokka_annotation \
  --query $I/annot/$B.faa \
  --max-hsps 1 \
  --max-target-seqs 1 \
  --out $O/diamond.$B,$B_REF_PROKKA_ANNOTATION.tab \
  --outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp gaps

sha256sum $O/diamond.$B,$B_REF_NCBI_ANNOTATION.tab > $O/diamond.$B,$B_REF_NCBI_ANNOTATION.tab.checksum
sha256sum $O/diamond.$B,$B_REF_PROKKA_ANNOTATION.tab > $O/diamond.$B,$B_REF_PROKKA_ANNOTATION.tab.checksum