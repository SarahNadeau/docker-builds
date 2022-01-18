#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# The input data has already had PhiX reads removed.
# This script runs trimmomatic to remove Illumina sequencing adaptors and quality-trim/quality-filter reads.

I=/test_data/trim_reads
O=/test_data/trim_reads

R1=$I/SRR5481494_sub-noPhiX-R1.fsq.gz
R2=$I/SRR5481494_sub-noPhiX-R2.fsq.gz
B=SRR5481494_sub

ADAPTERS="/Trimmomatic-0.39/adapters/TruSeq3-PE.fa"  # trimmomatic docs says these are used in HiSeq and MiSeq machines

echo "Running trimmomatic on test data to trim & filter reads"
trimmomatic \
  PE \
  -phred33 \
  $I/"$B"-noPhiX-R1.fsq.gz $I/"$B"-noPhiX-R2.fsq.gz \
  $O/"$B"_R1.paired.fq $O/"$B"_R1.unpaired.fq \
  $O/"$B"_R2.paired.fq $O/"$B"_R2.unpaired.fq \
  ILLUMINACLIP:$ADAPTERS:2:20:10:8:TRUE \
  SLIDINGWINDOW:6:30 LEADING:10 TRAILING:10 MINLEN:50

for R in R1 R2; do
  for P in paired unpaired; do
    # Thanks: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/
    cat "$O"/"$B"_$R.$P.fq | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" \
    | sha256sum >> $O/trim_checksums.txt
  done
done