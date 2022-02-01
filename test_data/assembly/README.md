## Genome assembly test data

This directory contains test data for genome assembly.

It has Illumina MiSeq data from [Moraxella catarrhalis](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=480) strain C53 (sequence type 98) produced by [Kozyreva et al. 2017](https://doi.org/10.1128/JCM.00361-17). 
The data was previously used to validate Illumina whole-genome sequencing for CLIA compliance.
Here, the raw reads are randomly sub-sampled from the original 106x to approximately 60x coverage to reduce file sizes.

This directory contains:
* sub-sampled raw reads (run SRR5481494, see [./scripts/get_reads.sh](./scripts/get_reads.sh))
* reference assembly (assembly GCF_001997265.1)

`trim_reads` contains:
* reads with PhiX removed (done in BBTools image test)
* quality-trimmed, filtered reads with sequencing adapters removed (done in Trimmomatic image test)
* reads with overlapping paired-end reads merged (done in FLASH image test)
* taxonomic assignment of reads (done in Kraken and Kraken 2 image tests)

`asm` contains:
* assembled draft genome (contigs.fasta, done in SPAdes image test)
* singleton and paired reads mapped back to the draft genome (.sam files, done in BWA image test)
* corrected genome (SRR5481494_sub.fasta) with changes (SRR5481494_sub.changes) (done in Pilon image test, note there were actually no changes)

`qa` contains:
* genome coverage (done in BEDTools image test)
* Multi-locus sequence typing results (done in MLST image test)

`annot` contains:
* genome annotation (done in Prokka image test)

`ssu` contains:
* rRNA sequences, including 16S, extracted from assembled genome (done in Barrnap image test)
* BLAST hits from extracted 16S sequence (done in NCBI-blast+ image test)

`snps` contains:
* .ggr output from running ParSNP v 1.5.6 on the reference assembly and corrected genome
* SNP and whole-genome alignments (concatenated locally co-linear blocks) output by ParSNP