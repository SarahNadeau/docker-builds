#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs samtools to sort and index an alignment.

I=/test_data
O=$I/asm
mkdir -p $O

B=SRR5481494_sub

echo "Running samtools on test data to sort and index an alignment"
# Sort and compress alignments with options -l: high compress level for output
samtools sort \
--reference $I/asm/"$B".uncorrected.fna \
-l 9 \
-o $O/"$B".paired.bam \
$I/asm/"$B".paired.sam
samtools sort \
--reference $I/asm/"$B".fasta \
-l 9 \
-o $O/"$B".single.bam \
$I/asm/"$B".single.sam

# Index the compressed alignments for fast random access
samtools index $O/"$B".paired.bam $O/"$B".paired.bam.bai
samtools index $O/"$B".single.bam $O/"$B".single.bam.bai

sha256sum $O/"$B".paired.bam > $O/"$B".paired.bam.checksum
sha256sum $O/"$B".paired.bam.bai > $O/"$B".paired.bam.bai.checksum
sha256sum $O/"$B".single.bam > $O/"$B".single.bam.checksum
sha256sum $O/"$B".single.bam.bai > $O/"$B".single.bam.bai.checksum