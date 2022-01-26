## Test data

This directory contains test data for bioinformatics tools.

It will have genomic data from [Moraxella catarrhalis](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=480) strain C53 (sequence type 98) produced by [Kozyreva et al. 2017](https://doi.org/10.1128/JCM.00361-17). 
The data was previously used to validate Illumina whole-genome sequencing for CLIA compliance.
Here, the raw reads are sub-sampled from the original 106x to approximately 60x coverage to reduce file sizes.

This directory contains:
* sub-sampled raw reads (run SRR5481494, see [./scripts/get_reads.sh](./scripts/get_reads.sh))
* reference assembly (assembly GCF_001997265.1)

`trim_reads` contains:
* reads with PhiX removed (done in BBTools image test)
* quality-trimmed, filtered reads with sequencing adapters removed (done in Trimmomatic image test)
* reads with overlapping paired-end reads merged (done in FLASH image test)
* taxonomic assignment of reads (done in Kraken and Kraken 2 image tests)

`asm` contains:
* assembled reads (done in SPAdes image test)
* aligned genome (done with ParSNP, see [./scripts/align.sh](./scripts/align.sh))
