#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs bwa to align paired-end reads to an (uncorrected) assembly and single-end reads to a (corrected) assembly.

I=/test_data
O=$I/asm
mkdir -p $O

B=SRR5481494_sub

echo "Running bwa on test data to align reads to draft assembly"

# Align paired-end reads to uncorrected assembly with options: -x: sequence type is intra-species contigs -v: output errors and warnings
bwa index $I/asm/"$B".uncorrected.fna  # Construct the FM-index for the reference assembly
bwa mem \
  -x intractg \
  -v 2 \
  $I/asm/"$B".uncorrected.fna \
  $I/trim_reads/"$B".notCombined_1.fastq.gz $I/trim_reads/"$B".notCombined_2.fastq.gz \
  > $O/"$B".paired.sam

# Align singleton reads to corrected assembly
zcat $I/trim_reads/"$B"_R1.unpaired.fq.gz \
     $I/trim_reads/"$B"_R2.unpaired.fq.gz \
     $I/trim_reads/"$B".extendedFrags.fastq.gz > $I/trim_reads/"$B".single.fq
bwa index $I/asm/"$B".fasta
bwa mem \
  -x intractg \
  -v 2 \
  $I/asm/"$B".fasta \
  $I/trim_reads/"$B".single.fq \
  > $O/"$B".single.sam

sha256sum $O/"$B".paired.sam > $O/"$B".paired.sam.checksum
sha256sum $O/"$B".single.sam > $O/"$B".single.sam.checksum