## Genome alignment test data

This directory contains test data from genome alignment and phylogenetic reconstruction.

It has assembled genome data from Escherichia coli O121:H19 produced in the ParSNP image test (see [here](../../parsnp/1.5.6/tests/scripts/run_positive_control.sh)). 
The original dataset is available [here](https://github.com/WGS-standards-and-analysis/datasets).

This directory contains:

`aln` contains files from ParSNP image test:
* SNP alignment parsnp.snps
* Full alignment parsnp.xmfa (with sequence names standardized for ClonalFrameML using [./scripts/standardize_xmfa_headers.sh](./scripts/standardize_xmfa_headers.sh))
* Reconstructed phylogeny parsnp.tree (sequence names must be unquoted for ClonalFrameML)

`recombination` contains files from ClonalFrameML image test:
* 