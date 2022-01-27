#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs blastn to find closest hits to the test data 16S rRNA sequence.

I=/test_data
O=$I/ssu
mkdir -p $O

B=SRR5481494_sub

echo "Running blastn on test data 16S rRNA sequence to find closest hits"
export BLASTDB=/db
blastn -word_size 10 -task blastn -db 16S_ribosomal_RNA \
 -query "${I}/ssu/16S.${B}.fna" \
 -out "${O}/${B}.blast.tsv" \
 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp ssciname"

sha256sum "${O}/${B}.blast.tsv" > "${O}/${B}.blast.tsv".checksum
