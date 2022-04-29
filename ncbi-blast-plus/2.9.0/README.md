# NCBI BLAST+

This image implements the command line version of the Basic Local Alignment Search Tool [NCBI BLAST+](https://blast.ncbi.nlm.nih.gov/Blast.cgi) for finding regions of similarity between sequences.
Documentation is available at https://www.ncbi.nlm.nih.gov/books/NBK279691/. 

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get input data (a 16S sequence)
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/44bd1eb9292b34a78c41a423805c14b63f2da56c/data/delete_me/e_coli_k12_16s.fna

# Download relevant blast database
WORKDIR=$PWD
mkdir -p /db && cd /db
update_blastdb.pl 16S_ribosomal_RNA
tar -xvf 16S_ribosomal_RNA.tar.gz
cd $WORKDIR

# Specify database location for tool
export BLASTDB=/db

# Run blastn to find closest hits to nucleotide sequence with options:
    # -task blastn: traditional BLASTN requiring an exact match of 11
    # -outfmt 6: tabular output format, further options are fields to include
blastn \
    -task blastn \
    -db 16S_ribosomal_RNA \
    -query e_coli_k12_16s.fna \
    -outfmt "6 sseqid pident length mismatch gapopen gaps ssciname" \
    -out blast.tsv
```

## Example output

The output file lists the closest hits:

```
head blast.tsv

# gi|444439587|ref|NR_074902.1|   99.222  1543    10      2       2       Escherichia fergusonii ATCC 35469
# gi|559795236|ref|NR_104826.1|   99.080  1522    12      2       2       Shigella sonnei
# gi|1018196593|ref|NR_136472.1|  99.269  1504    11      0       0       Escherichia marmotae
# gi|559795308|ref|NR_104901.1|   98.813  1516    16      2       2       Shigella boydii
# gi|444439595|ref|NR_074910.1|   97.799  1545    32      2       2       Salmonella enterica subsp. enterica serovar Typhimurium
# gi|219846739|ref|NR_026331.1|   99.194  1489    10      2       2       Shigella flexneri
# gi|219846740|ref|NR_026332.1|   98.992  1488    14      1       1       Shigella dysenteriae
# gi|444439573|ref|NR_074888.1|   97.602  1543    35      2       2       Salmonella bongori
# gi|228716249|ref|NR_027549.1|   99.050  1474    12      2       2       Escherichia fergusonii ATCC 35469
# gi|1864207181|ref|NR_169476.1|  97.399  1538    38      2       2       Kosakonia quasisacchari
```
