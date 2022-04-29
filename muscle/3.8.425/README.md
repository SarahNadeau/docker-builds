# MUSCLE

This image implements [MUSCLE](https://blast.ncbi.nlm.nih.gov/Blast.cgi), a software for making multiple alignments of biological sequences.
Documentation is available at https://drive5.com/muscle5/manual/. 

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get data (SARS-CoV-2 whole-genome sequences)
wget -nv \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/858/895/GCF_009858895.2_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.fna.gz \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/011/537/615/GCA_011537615.1_ASM1153761v1/GCA_011537615.1_ASM1153761v1_genomic.fna.gz \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/011/537/705/GCA_011537705.1_ASM1153770v1/GCA_011537705.1_ASM1153770v1_genomic.fna.gz
gunzip *.gz
cat *.fna >> genomes.fna

# Run tool to align nucleotide sequences
muscle \
  -in genomes.fna \
  -out genomes.fna.aln
```

## Example output

The on-screen output tells you what the program did:
```
MUSCLE v3.8.425 by Robert C. Edgar

http://www.drive5.com/muscle
This software is donated to the public domain.
Please cite: Edgar, R.C. Nucleic Acids Res 32(5), 1792-97.

genomes 3 seqs, lengths min 29903, max 29923, avg 29909
00:00:00    11 MB(-4%)  Iter   1  100.00%  K-mer dist pass 1ist pass 1
00:00:00    11 MB(-4%)  Iter   1  100.00%  K-mer dist pass 2ist pass 2
00:01:00  1012 MB(-380%)  Iter   1  100.00%  Align nodeign node       
00:01:00  1012 MB(-380%)  Iter   1  100.00%  Root alignment alignment
00:01:00  1012 MB(-380%)  Iter   2  100.00%  Root alignment
00:02:27  1012 MB(-381%)  Iter   3  100.00%  Refine bipartsne biparts
```
