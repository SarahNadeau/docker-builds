#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs pilon to improve a draft assembly.

I=/test_data
O=$I/asm
mkdir -p $O

B=SRR5481494_sub

echo "Running pilon on test data to improve a draft assembly"
pilon \
--genome $I/asm/"$B".uncorrected.fna \
--frags $I/asm/"$B".paired.bam \
--output "$B" \
--outdir $O \
--changes \
--fix snps,indels \
--mindepth 0.50

sha256sum $O/"$B".fasta > $O/"$B".fasta.checksum
sha256sum $O/"$B".changes > $O/"$B".changes.checksum