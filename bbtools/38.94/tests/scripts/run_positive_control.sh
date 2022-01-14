#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs bbduk.sh to check that PhiX contaminants from Illumina spike-in are successfully removed.

I=/test_data
O=$I/trim_reads
mkdir -p $O

R1=$I/SRR5481494_sub_1.fastq.gz
R2=$I/SRR5481494_sub_2.fastq.gz
B=SRR5481494_sub

PHIX="/bbmap/resources/phix174_ill.ref.fa.gz"

echo "Running bbduk on test data to remove PhiX"
bbduk.sh \
  k=31 \
  hdist=1 \
  ref="$PHIX" \
  in="$R1" \
  in2="$R2"\
  out=$O/"$B"-noPhiX-R1.fsq \
  out2=$O/"$B"-noPhiX-R2.fsq \
  qin=auto \
  qout=33 \
  overwrite=t

for R in R1 R2; do
  # Thanks: https://edwards.flinders.edu.au/sorting-fastq-files-by-their-sequence-identifiers/
  cat "$O"/"$B"-noPhiX-$R.fsq | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" > "$O"/"$B"-noPhiX-$R.fsq.sorted
  shasum -a 256 "$O"/"$B"-noPhiX-$R.fsq.sorted > "$O"/"$B"-noPhiX-$R.fsq.sorted.checksum
done