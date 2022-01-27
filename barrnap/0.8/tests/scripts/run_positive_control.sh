#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs Barrnap to extract rRNA sequences.

I=/test_data
O=$I/ssu
mkdir -p $O

B=SRR5481494_sub

echo "Running Barrnap on test data to extract rRNA sequences"
barrnap "${I}/asm/${B}.fasta" > "${O}/rrna.${B}.gff"

echo "Extracing 16S rRNA from barrnap results"
grep '16S' "${O}/rrna.${B}.gff" > "${O}"/16S.${B}.gff
bedtools getfasta -fi "${I}/asm/${B}.fasta" -bed "${O}"/16S.${B}.gff -fo "${O}"/16S.${B}.fna

sha256sum "${O}/rrna.${B}.gff" > "${O}/rrna.${B}.gff".checksum