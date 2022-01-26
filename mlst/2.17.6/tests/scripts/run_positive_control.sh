#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs MLST to scan contigs against PubMLST typing schemes.

I=/test_data
O=$I/qa
mkdir -p $O

B=SRR5481494_sub

echo "Running MLST on test data to scan contigs against PubMLST"

mlst "$I/asm/$B.fasta" > $O/Summary.MLST.tab

sha256sum $O/Summary.MLST.tab > $O/Summary.MLST.tab.checksum
