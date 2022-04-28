# BBTools

This image implements the software [BBTools](https://jgi.doe.gov/data-and-tools/software-tools/bbtools/) for analysis of DNA and RNA sequence data.
Documentation is available at https://jgi.doe.gov/data-and-tools/software-tools/bbtools/bb-tools-user-guide/.

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get data
wget -nv https://github.com/nf-core/test-datasets/raw/mag/test_data/test_minigut_R1.fastq.gz -O R1.fastq.gz
wget -nv https://github.com/nf-core/test-datasets/raw/mag/test_data/test_minigut_R2.fastq.gz -O R2.fastq.gz

# Use PhiX reference genome that comes packaged with with tool
PHIX="/bbmap/resources/phix174_ill.ref.fa.gz"

# Run tool to filter out PhiX reads
# Note: you may need to up the memory allocated with -Xmx<larger amount>
bbduk.sh \
  -Xmx166m \
  k=31 \
  hdist=1 \
  ref="$PHIX" \
  in=R1.fastq.gz \
  in2=R2.fastq.gz \
  out=R1_filtered.fastq \
  out2=R2_filtered.fastq \
  qin=auto \
  qout=33

```

## Example output

The on-screen output tells you what the program did:
```
Executing jgi.BBDuk [-Xmx166m, k=31, hdist=1, ref=/bbmap/resources/phix174_ill.ref.fa.gz, in=R1.fastq.gz, in2=R2.fastq.gz, out=R1_filtered.fastq, out2=R2_filtered.fastq, qin=auto, qout=33]
Version 38.94

0.043 seconds.
Initial:
Memory: max=167m, total=167m, free=112m, used=55m

Added 487396 kmers; time:     0.231 seconds.
Memory: max=167m, total=167m, free=109m, used=58m

Input is being processed as paired
Started output streams:       0.096 seconds.
Processing time:              0.961 seconds.

Input:                        100000 reads            12600000 bases.
Contaminants:                 0 reads (0.00%)         0 bases (0.00%)
Total Removed:                0 reads (0.00%)         0 bases (0.00%)
Result:                       100000 reads (100.00%)  12600000 bases (100.00%)

Time:                                 1.292 seconds.
Reads Processed:        100k  77.38k reads/sec
Bases Processed:      12600k  9.75m bases/sec
```

The result files from this command are:
```
R1_filtered.fastq
R2_filtered.fastq
```
