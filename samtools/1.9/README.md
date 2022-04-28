# Samtools

This image implements the software [Samtools](http://www.htslib.org/), a suite of programs for interacting with high-throughput sequencing data.
Documentation is available at http://www.htslib.org/doc/.

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get input data
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/genomics/sarscov2/genome/genome.fasta
wget -nv https://github.com/nf-core/test-datasets/raw/modules/data/genomics/sarscov2/illumina/bam/test.paired_end.bam

# Run program to sort and index an alignment

# Sort and compress alignment with options -l: high compress level for output
samtools sort \
    --reference genome.fasta \
    -l 9 \
    -o test.paired_end_sorted.bam \
    test.paired_end.bam

# Index the compressed alignment for fast random access
samtools index test.paired_end_sorted.bam test.paired_end_sorted.bam.bai
```

## Example output

The result files from these commands are:
```
test.paired_end_sorted.bam  # sorted, compressed assembly
test.paired_end_sorted.bam.bai  # indexed asssembly
```
