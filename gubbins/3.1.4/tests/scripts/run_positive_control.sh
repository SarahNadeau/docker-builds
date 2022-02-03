#!/bin/bash
# This script uses assembly files from Escherichia coli strains.
# It runs Gubbins to infer recombination based on a sequence alignment and a starting phylogeny produced by ParSNP.

I=/test_data
O=$I/recombination
mkdir -p $O

B=parsnp

echo "Running Gubbins on test data"
run_gubbins.py \
  --starting-tree $I/"$B".tree \
  --prefix $O/"$B" \
    $I/"$B".fasta

sha256sum $O/"$B".recombination_predictions.gff  > $O/"$B".recombination_predictions.gff.checksum
sha256sum $O/"$B".node_labelled.final_tree.tre > $O/"$B".node_labelled.final_tree.tre.checksum