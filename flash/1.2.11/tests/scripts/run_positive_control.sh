#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# The input data has already had PhiX removed and quality filtered/trimmed reads.
# This script runs FLASH to merge overlapping paired-end reads.

I=/test_data/trim_reads
O=/test_data/trim_reads
mkdir -p $O

R1=$I/SRR5481494_sub_R1.paired.fq.gz
R2=$I/SRR5481494_sub_R2.paired.fq.gz
B=SRR5481494_sub

# Get read length, make minimum overlap 80% of read length
READ_LEN=$(gunzip -c "$R1" | head -n 400 \
  | awk 'NR%4==2 {if(length > x) {x=length; y=$0}} END{print length(y)}')
OVERLAP_LEN=$(echo "$READ_LEN * 0.8" | bc | sed 's/\..*//')
echo "INFO: $READ_LEN bp read length detected from raw input"

echo "Running FLASH on test data to merge overlapping paired-end reads"
flash \
  $R1 $R2 \
  --min-overlap=$OVERLAP_LEN \
  --max-overlap=$READ_LEN \
  --output-prefix=$B \
  --output-directory=$O

for F in $B.extendedFrags.fastq $B.notCombined_1.fastq $B.notCombined_2.fastq; do
  # Thanks: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/
  cat $O/$F | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" | sha256sum >> "$O"/merge_checksums.txt
done