# Barrnap

This image implements the software [Barrnap](https://vicbioinformatics.com/software.barrnap.shtml) for predicting ribosomal RNA sequences.
Documentation is available at https://github.com/tseemann/barrnap/blob/master/README.md#barrnap.

The image additionally includes:
* Hmmer version 3.3.2
* BEDTools version 2.30.0

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get data
wget -nv https://github.com/nf-core/test-datasets/raw/bactmap/genome/NCTC13799.fna

# Run tool to extract rRNA sequences
barrnap NCTC13799.fna > rrna.gff

# Get fasta file of predicted rRNA sequences
bedtools getfasta \
    -fi NCTC13799.fna \
    -bed rrna.gff \
    -fo rrna.fasta
```

## Example output

The on-screen output tells you what the program did:
*Note: only barrnap command output shown
```
[13:13:59] This is barrnap 0.8
[13:13:59] Written by Torsten Seemann <torsten.seemann@gmail.com>
[13:13:59] Obtained from https://github.com/tseemann/barrnap
[13:13:59] Detected operating system: linux
[13:13:59] Adding /usr/local/bin/../binaries/linux to end of PATH
[13:13:59] Using HMMER binary: /usr/local/bin/nhmmer
[13:13:59] Will use 8 threads
[13:13:59] Setting evalue cutoff to 1e-06
[13:13:59] Will tag genes < 0.8 of expected length.
[13:13:59] Will reject genes < 0.5 of expected length.
[13:13:59] Using database: /usr/local/bin/../db/bac.hmm
[13:13:59] Scanning NCTC13799.fna for bac rRNA genes... please wait
[13:13:59] Command: /usr/local/bin/nhmmer --cpu 8 -E 1e-06 --w_length 3878  -o /dev/null --tblout /dev/stdout \/usr\/local\/bin\/\.\.\/db\/bac\.hmm NCTC13799\.fna
[13:14:05] Found: 16S_rRNA NZ_LT906437.1 L=1536/1585 1895036..1896571 + 16S ribosomal RNA
[13:14:05] Found: 16S_rRNA NZ_LT906437.1 L=1536/1585 1205257..1206792 - 16S ribosomal RNA
[13:14:05] Found: 16S_rRNA NZ_LT906437.1 L=1536/1585 1586211..1587746 - 16S ribosomal RNA
[13:14:05] Found: 16S_rRNA NZ_LT906437.1 L=1536/1585 1667387..1668922 - 16S ribosomal RNA
[13:14:05] Found: 23S_rRNA NZ_LT906437.1 L=2889/3232 1897178..1900066 + 23S ribosomal RNA
[13:14:05] Found: 23S_rRNA NZ_LT906437.1 L=2889/3232 1201762..1204650 - 23S ribosomal RNA
[13:14:05] Found: 23S_rRNA NZ_LT906437.1 L=2889/3232 1582716..1585604 - 23S ribosomal RNA
[13:14:05] Found: 23S_rRNA NZ_LT906437.1 L=2889/3232 1663892..1666780 - 23S ribosomal RNA
[13:14:05] Found: 5S_rRNA NZ_LT906437.1 L=109/119 1900166..1900274 + 5S ribosomal RNA
[13:14:05] Found: 5S_rRNA NZ_LT906437.1 L=109/119 1201554..1201662 - 5S ribosomal RNA
[13:14:05] Found: 5S_rRNA NZ_LT906437.1 L=109/119 1582508..1582616 - 5S ribosomal RNA
[13:14:05] Found: 5S_rRNA NZ_LT906437.1 L=109/119 1663684..1663792 - 5S ribosomal RNA
[13:14:05] Found 12 ribosomal RNA features.
[13:14:05] Sorting features and outputting GFF3...
```

There result files from these commands are:
```
rrna.gff  # extracted rRNA sequences in gff format
NCTC13799.fna.fai  # genome index file
rrna.fasta  # extracted rRNA sequences in fasta format
```
