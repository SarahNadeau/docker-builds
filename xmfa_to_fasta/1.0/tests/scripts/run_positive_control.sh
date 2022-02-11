#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# The input data has already had PhiX reads removed.
# This script runs trimmomatic to remove Illumina sequencing adaptors and quality-trim/quality-filter reads.

I=/test_data/aln
O=$I

echo "Running scripts on test data to get FastA file"
xmfa_to_fasta.sh \
  -i $I/parsnp.xmfa.gz \
  -p \
  -o $O/parsnp.fasta

# Make FastA file one line per sequence, then sort it (no longer valid FastA but just for checksum)
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $O/parsnp.fasta | sort | sha256sum >> $O/parsnp.fasta.checksum