#!/bin/bash
# This script pulls read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs bbduk.sh to check that PhiX contaminants from Illumina spike-in are successfully removed.

I=pos_control/input_dir
O=pos_control/output_dir/trim_reads
RUN=SRR1509643

mkdir -p $I
mkdir -p $O

# Download test data from ENA FTP site if not already available (e.g. via a mounted volume)
wget --directory-prefix $I --no-clobber -q \
  ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/003/SRR1509643/SRR1509643_1.fastq.gz \
  ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/003/SRR1509643/SRR1509643_2.fastq.gz

R1=$I/${RUN}_1.fastq
R2=$I/${RUN}_2.fastq
B=$RUN

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