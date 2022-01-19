#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# The input data has already had PhiX removed, quality filtered/trimmed, and merged reads.
# This script runs SPAdes to assemble the reads.

I=/test_data/trim_reads
O=/test_data/asm
mkdir -p $O

R1=$I/SRR5481494_sub.notCombined_1.fastq.gz
R2=$I/SRR5481494_sub.notCombined_2.fastq.gz
MERGED=$I/SRR5481494_sub.extendedFrags.fastq.gz
B=SRR5481494_sub

# Unless specified otherwise, let SPAdes use 2GB RAM
if [ -z "${RAMSIZE_TOT}" ]; then
    RAMSIZE_TOT=2
fi

echo "Running SPAdes to assemble test data"
spades.py \
  --pe1-1 $R1 \
  --pe1-2 $R2 \
  --pe1-s $MERGED \
  --memory "$RAMSIZE_TOT" \
  -o $O/"$B" \
  --phred-offset 33 \
  --only-assembler

# Adapted from: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/
cat $O/$B/contigs.fasta | paste - - | sort -k1,1 -t " " | tr "\t" "\n" | sha256sum >> "$O"/contigs_checksum.txt