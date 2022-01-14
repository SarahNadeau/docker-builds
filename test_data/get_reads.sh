#!/bin/bash

# Download raw reads from ENA FTP site
wget -nc \
  ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR548/004/SRR5481494/SRR5481494_1.fastq.gz \
  ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR548/004/SRR5481494/SRR5481494_2.fastq.gz

# Subsample raw reads using bbtools
docker pull staphb/bbtools:38.94
docker run --rm --mount type=bind,src="$(pwd)",dst=/data staphb/bbtools:38.94 \
  reformat.sh \
    in1=SRR5481494_1.fastq.gz \
    in2=SRR5481494_2.fastq.gz \
    out1=SRR5481494_sub_1.fastq.gz \
    out2=SRR5481494_sub_2.fastq.gz \
    samplerate=0.57 \
    overwrite=true

rm SRR5481494_1.fastq.gz
rm SRR5481494_2.fastq.gz