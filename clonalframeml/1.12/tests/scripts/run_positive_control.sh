#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs ClonalFrameML to infer recombination based on a phylogeny and a sequence alignment at the tips.

I=/test_data
O=$I/recombination
mkdir -p $O

B=parsnp

echo "Running ClonalFrameML on test data in XMFA format"
ClonalFrameML \
  $I/"$B".tree \
  $I/"$B".xmfa \
  $O/"$B" \
  -xmfa_file true

#echo "Running ClonalFrameML on test data in FastA format"
#ClonalFrameML \
#  $I/"$B".tree \
#  $I/"$B".fasta \
#  $O/"$B"_fasta

echo "Generating PDF output"
cd $O
Rscript /ClonalFrameML/src/cfml_results.R "$B"
#Rscript /ClonalFrameML/src/cfml_results.R "$B"_fasta

sha256sum $O/"$B".cfml.pdf > $O/"$B".cfml.pdf.checksum
#sha256sum $O/"$B".single.sam > $O/"$B".single.sam.checksum