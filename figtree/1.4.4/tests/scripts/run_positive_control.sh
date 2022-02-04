#!/bin/bash
# This script runs FigTree to visualize a newick-formatted phylogenetic tree.

echo "Running FigTree on test data to visualize a phylogeny"
figtree \
  -graphic PDF \
  /tests/files/test.tree \
  /tests/test.pdf

figtree \
  -graphic PNG \
  /tests/files/test.tree \
  /tests/test.png

sha256sum /tests/test.png > /tests/test.png.checksum