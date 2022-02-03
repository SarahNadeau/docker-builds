#!/bin/bash
# This script runs the quast tutorial from the manual. It uses data shipped in the quast tarball.

QUAST_DIR=/quast-5.0.2

$QUAST_DIR/quast.py $QUAST_DIR/test_data/contigs_1.fasta \
  $QUAST_DIR/test_data/contigs_2.fasta \
  -r $QUAST_DIR/test_data/reference.fasta.gz \
  -g $QUAST_DIR/test_data/genes.gff



