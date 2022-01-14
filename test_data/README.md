## Test data

This directory contains test data for bioinformatics tools.

It will have genomic data from [Moraxella catarrhalis](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=480) produced by [Kozyreva et al. 2017](https://doi.org/10.1128/JCM.00361-17). 
The data was previously used to validate Illumina whole-genome sequencing for CLIA compliance.
Here, the raw reads are downsampled from the original 106x to approximately 60x coverage to reduce file sizes.

It will have files from each stage of this pipeline:
* raw reads (run SRR5481494)
* remove PhiX reads
* remove sequencing adapters, quality-trim reads
* reference assembly