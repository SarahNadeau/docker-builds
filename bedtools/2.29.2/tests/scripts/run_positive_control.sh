#!/bin/bash
# This script uses read files from NCBI for reference strain Escherichia coli O157:H7 CDC EDL 933.
# It runs BEDTools to calculate assembly coverage.

I=/test_data
O=$I/qa
mkdir -p $O

B=SRR5481494_sub

echo "Running BEDTools on test data to calculate assembly coverage"

single_cov=$(bedtools genomecov -d -split -ibam $I/asm/"$B".single.bam \
  | awk '{sum+=$3} END{print sum " bp Singleton Reads Mapped (" sum/NR "x)\t"}')
cov_nfo=$(bedtools genomecov -d -split -ibam $I/asm/"$B".paired.bam \
  | awk -v SEcov="${single_cov}" 'BEGIN{sum=0} {sum+=$3} END{
  print sum " bp Paired Reads Mapped (" sum/NR "x)\t" SEcov NR " bp Genome"}')
echo -e "${B}\t${cov_nfo}" >> $O/Summary.Illumina.CleanedReads-AlnStats.tab

sha256sum $O/Summary.Illumina.CleanedReads-AlnStats.tab > $O/Summary.Illumina.CleanedReads-AlnStats.tab.checksum
