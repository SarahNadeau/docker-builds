#!/bin/bash
# This script runs swga using (truncated) data from the tool's tutorial at https://github.com/eclarke/swga/wiki/Example-Workflow.

I=/test_data/
O=/test_data/swga_results
mkdir -p $O

# Download test genomes
wget "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=15594346&rettype=fasta&retmode=text" \
  -O $I/borrelia.fasta
wget "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=556503834&rettype=fasta&retmode=text" \
  -O $I/ecoli.fasta

# Truncate test genomes so it runs faster
head -100 $I/borrelia.fasta > $I/borrelia_truncated.fasta
head -100 $I/ecoli.fasta > $I/ecoli_truncated.fasta

# Must remove whitespace or else swga kicks into interactive mode to ask you to do it
sed -i.bak -e '/^$/d' $I/borrelia.fasta
sed -i.bak -e '/^$/d' $I/ecoli.fasta
rm $I/*.bak

# Must provide an exclusionary sequences file to again avoid interactive mode
echo ">dummy_seq\n" > $I/dummy.fasta

# Run data through swga workflow

cd $O  # swga init initializes workspace in the current directory
swga init \
  -f $I/borrelia_truncated.fasta \
  -b $I/ecoli_truncated.fasta \
  -e $I/dummy.fasta

swga count

swga filter

# This takes forever (> 30min) so don't do. Seemed to be running fine though.
#swga find_sets

N_PRIMERS_TO_EXPORT=100
swga export primers \
  --limit $N_PRIMERS_TO_EXPORT \
  --order_by gini \
  --output $O/primers_top_100_gini.txt

sha256sum $O/primers_top_${N_PRIMERS_TO_EXPORT}_gini.txt > $O/primers_top_${N_PRIMERS_TO_EXPORT}_gini.txt.checksum