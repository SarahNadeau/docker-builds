## Genome alignment test data

This directory contains test data from genome alignment and phylogenetic reconstruction.

It has assembled genome data from Escherichia coli O121:H19. 
The original dataset is available [here](https://github.com/WGS-standards-and-analysis/datasets).

This directory contains:

`aln` contains files from ParSNP image test:
* SNP alignment parsnp.snps
* Reconstructed phylogeny parsnp.tree (sequence names unquoted for ClonalFrameML)
* Full alignment parsnp.xmfa (sequence headers changed from numbers to names for ClonalFrameML)
* Full alignment parsnp.fasta (concatenated locally co-linear blocks). Generated with:
  * [./scripts/standardize_xmfa_headers.sh](./scripts/standardize_xmfa_headers.sh),
  * [./scripts/convertAlignment.pl](./scripts/convertAlignment.pl) written by Lee Katz,
  * [./scripts/standardize_fasta_headers.sh](./scripts/standardize_fasta_headers.sh)).

`recombination` contains files from ClonalFrameML image test:
* files named like parsnp_fa were generated using parsnp.fasta from above, otherwise files were generated using parsnp.xmfa from above
* parsnp*.importation_status.txt contains (quoting from manual) the list of reconstructed recombination events. There is one line for each event, the first column indicates the branch on which the event was found, and the second and third columns indicate the first and last genomic positions affected by the recombination event.
* parsnp*.labelled_tree.newick contains the ClonalFrameML output tree (branch lengths corrected to account for recombination).