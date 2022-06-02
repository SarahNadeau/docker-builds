# [docker-builds](#)
This repository contains the Dockerfiles and other assorted files necessary for building Docker images for a variety of programs used by members of the StaPH-B (State Public Health Lab Bioinformatics) consortium. The purpose of this repository is to provide a centralized location for Docker images that is easily accessible for users, with clear documentation on how the containers were built and how to use them.

If you would like to contribute with a Docker image or improve upon the existing images, please fork the repository, make your changes/additions, and submit a pull request. If you are having an issue with an existing image, please submit an issue. We welcome any and all feedback!
[See more details on how to contribute here](https://staph-b.github.io/docker-builds/contribute/)

## [Docker User Guide](https://staph-b.github.io/docker-builds/)
We have also created a user guide that outlines methods and best practices for using and developing docker containers.
[Docker User Guide](https://staph-b.github.io/docker-builds/)

#### What about Singularity?
For many people Docker is not an option, but Singularity is. Most Docker containers are compatible with Singularity and can easily be converted to Singularity format. Please see the User Guide linked above to for instructions on how to download docker images from dockerhub and how to run them using Singularity. We've worked hard to ensure that our containers are compatibile with Singularity, but if you find one that isn't, please leave an issue and let us know!

## Docker image repositories & hosting
We host all of our docker images on two different repositories and periodically sync the images between the two:

  1. Dockerhub - https://hub.docker.com/r/staphb/
  2. Quay.io - https://quay.io/organization/staphb/

In November 2020, Docker began to implement pull rate limits for images hosted on dockerhub. This limits the number of `docker pull`'s per time period (e.g. anonymous users allowed 100 pulls per six hours). We applied and were approved for Docker's "Open Source Program," which should have removed the pull rate limits for all `staphb` docker images! 🎉 🥳 If you encounter an error such as `ERROR: toomanyrequests: Too Many Requests.` or `You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits.` , please let us know by [submitting an issue.](https://github.com/StaPH-B/docker-builds/issues)

**A huge thank you goes to the folks at Docker for supporting our efforts to distribute & share critical tools for public health bioinformatics. This has been especially important during the COVID-19 global pandemic, as many of these tools are used to conduct genomic surveillance on the SARS-CoV-2 virus as well as other important pathogens of public health concern.**

To learn more about the docker pull rate limits and the open source software program, please see these blog posts ([1](https://www.docker.com/blog/docker-hub-image-retention-policy-delayed-and-subscription-updates/), [2](https://www.docker.com/blog/scaling-docker-to-serve-millions-more-developers-network-egress/), and [3](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/)) and Docker documentation ([1](https://docs.docker.com/docker-hub/download-rate-limit/)).

*NOTE: In the table below, we do not provide individual links to the various tools on quay.io, please visit the above quay.io link to find all of our docker images.*

## [Available Docker images](https://hub.docker.com/r/staphb/)

| Software | Version | Link |
| :--------: | ------- | -------- |
| [ABRicate](https://hub.docker.com/r/staphb/abricate/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/abricate)](https://hub.docker.com/r/staphb/abricate) | <ul><li>0.8.7</li><li>0.8.13</li><li>0.8.13s (+serotypefinder db)</li><li>0.9.8</li><li>1.0.0</li></ul> | https://github.com/tseemann/abricate |
| [any2fasta](https://hub.docker.com/r/staphb/any2fasta/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/any2fasta)](https://hub.docker.com/r/staphb/any2fasta) | <ul><li>0.4.2</li></ul> | https://github.com/tseemann/any2fasta |
| [ARIBA](https://hub.docker.com/r/staphb/ariba/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/ariba)](https://hub.docker.com/r/staphb/ariba) | <ul><li>2.14.4</li></ul> | https://github.com/sanger-pathogens/ariba |
| [artic-ncov2019](https://hub.docker.com/r/staphb/artic-ncov2019) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/artic-ncov2019)](https://hub.docker.com/r/staphb/artic-ncov2019) | <ul><li>1.3.0</ul> | https://github.com/artic-network/fieldbioinformatics |
| [artic-ncov2019-epi2me](https://hub.docker.com/r/staphb/artic-ncov2019-epi2me) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/artic-ncov2019-epi2me)](https://hub.docker.com/r/staphb/artic-ncov2019-epi2me) | <ul><li>0.3.10</ul> | https://github.com/epi2me-labs/wf-artic |
| [artic-ncov2019-medaka](https://hub.docker.com/r/staphb/artic-ncov2019-medaka) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/artic-ncov2019-medaka)](https://hub.docker.com/r/staphb/artic-ncov2019-medaka) | <ul><li>1.1.0</ul> | https://github.com/artic-network/artic-ncov2019 |
| [artic-ncov2019-nanopolish](https://hub.docker.com/r/staphb/artic-ncov2019-nanopolish) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/artic-ncov2019-nanopolish)](https://hub.docker.com/r/staphb/artic-ncov2019-nanopolish) | <ul><li>1.1.0</ul> | https://github.com/artic-network/artic-ncov2019 |
| [Augur](https://github.com/nextstrain/augur) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/augur)](https://hub.docker.com/r/staphb/augur) | <ul><li>6.3.0</li><li>7.0.2</li><li>8.0.0</li><li>9.0.0</li></ul> | https://github.com/nextstrain/augur |
| [Auspice](https://github.com/nextstrain/auspice) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/auspice)](https://hub.docker.com/r/staphb/auspice) | <ul><li>2.12.0</li></ul> | https://github.com/nextstrain/auspice |
| [BBTools](https://hub.docker.com/r/staphb/bbtools/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/bbtools)](https://hub.docker.com/r/staphb/bbtools) | <ul><li>38.76</li><li>38.86</li><li>38.95</li><li>38.96</li></ul> | https://jgi.doe.gov/data-and-tools/bbtools/ |
| [bcftools](https://hub.docker.com/r/staphb/bcftools/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/bcftools)](https://hub.docker.com/r/staphb/bcftools) | <ul><li>1.10.2</li><li>1.11</li><li>1.12</li><li>1.13</li><li>1.14</li><li>1.15</li></ul> | https://github.com/samtools/bcftools |
| [bedtools](https://hub.docker.com/r/staphb/bedtools/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/bedtools)](https://hub.docker.com/r/staphb/bedtools) | <ul><li>2.29.2</li><li>2.30.0</li></ul> | https://bedtools.readthedocs.io/en/latest/ <br/>https://github.com/arq5x/bedtools2 |
| [berrywood-report-env](https://hub.docker.com/r/staphb/berrywood-report-env/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/berrywood-report-env)](https://hub.docker.com/r/staphb/berrywood-report-env) | <ul><li>1.0</li></ul> | none |
| [bowtie2](https://hub.docker.com/r/staphb/bowtie2/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/bowtie2)](https://hub.docker.com/r/staphb/bowtie2) | <ul><li>2.4.4</li><li>2.4.5</li></ul> | http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml <br/>https://github.com/BenLangmead/bowtie2 |
| [BWA](https://hub.docker.com/r/staphb/bwa) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/bwa)](https://hub.docker.com/r/staphb/bwa) | <ul><li>0.7.17</li></ul> | https://github.com/lh3/bwa |
| [Canu](https://hub.docker.com/r/staphb/canu) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/canu?)](https://hub.docker.com/r/staphb/canu)| <ul><li>2.0</li><li>2.1.1</li><li>2.2</li></ul> | https://canu.readthedocs.io/en/latest/ <BR/> https://github.com/marbl/canu |
| [Canu-Racon](https://hub.docker.com/r/staphb/canu-racon/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/canu-racon)](https://hub.docker.com/r/staphb/canu-racon) | <ul><li>1.7.1 (Canu), 1.3.1 (Racon), 2.13 (minimap2)</li><li>1.9 (Canu), 1.4.3 (Racon), 2.17 (minimap2)</li><li>1.9i (Canu), 1.4.3 (Racon), 2.17 (minimap2), (+racon_preprocess.py)</li><li>2.0 (Canu), 1.4.3 (Racon), 2.17 (minimap2)</li></ul> | https://canu.readthedocs.io/en/latest/ <br/> https://github.com/lbcb-sci/racon <br/> https://github.com/isovic/racon (ARCHIVED) <br/> https://lh3.github.io/minimap2/ |
| [centroid](https://hub.docker.com/r/staphb/centroid/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/centroid)](https://hub.docker.com/r/staphb/centroid) | <ul><li>1.0.0</li></ul> | https://github.com/stjacqrm/centroid |
| [CDC-SPN](https://hub.docker.com/r/staphb/cdc-spn/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/cdc-spn)](https://hub.docker.com/r/staphb/cdc-spn) | <ul><li>0.1 (no version)</li></ul> | https://github.com/BenJamesMetcalf/Spn_Scripts_Reference |
| [cfsan-snp-pipeline](https://hub.docker.com/r/staphb/cfsan-snp-pipeline) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/cfsan-snp-pipeline)](https://hub.docker.com/r/staphb/cfsan-snp-pipeline) | <ul><li>2.0.2</li></ul> | https://github.com/CFSAN-Biostatistics/snp-pipeline |
| [Circlator](https://hub.docker.com/r/staphb/circlator) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/circlator)](https://hub.docker.com/r/staphb/circlator) | <ul><li>1.5.6</li></ul> | https://github.com/sanger-pathogens/circlator |
| [Clustalo](https://hub.docker.com/r/staphb/clustalo) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/clustalo)](https://hub.docker.com/r/staphb/clustalo) | <ul><li>1.2.4</li></ul> | http://www.clustal.org/omega/ |
| [colorid](https://hub.docker.com/r/staphb/colorid) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/colorid)](https://hub.docker.com/r/staphb/colorid) | <ul><li>0.1.4.3</li></ul> | https://github.com/hcdenbakker/colorid |
| [cutshaw-report-env](https://hub.docker.com/r/staphb/cutshaw-report-env) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/cutshaw-report-env)](https://hub.docker.com/r/staphb/cutshaw-report-env) | <ul><li>1.0.0</li></ul> | https://github.com/VADGS/CutShaw |
| [datasets-sars-cov-2](https://github.com/CDCgov/datasets-sars-cov-2) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/datasets-sars-cov-2)](https://hub.docker.com/r/staphb/datasets-sars-cov-2) | <ul><li>0.6.2</li><li>0.6.3</li></ul> | https://github.com/CDCgov/datasets-sars-cov-2 |
| [DSK](https://hub.docker.com/r/staphb/dsk) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/dsk)](https://hub.docker.com/r/staphb/dsk) | <ul><li>0.0.100</li></ul> | https://gatb.inria.fr/software/dsk/ |
| [emm-typing-tool](https://hub.docker.com/r/staphb/emm-typing-tool) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/emm-typing-tool)](https://hub.docker.com/r/staphb/emm-typing-tool) | <ul><li>0.0.1 (no version)</li></ul> | https://github.com/phe-bioinformatics/emm-typing-tool |
| [FastANI](https://hub.docker.com/r/staphb/fastani) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/fastani)](https://hub.docker.com/r/staphb/fastani) | <ul><li>1.1</li><li>1.32</li><li>1.33</li></ul> | https://github.com/ParBLiSS/FastANI |
| [FastTree](https://hub.docker.com/r/staphb/fasttree) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/fasttree)](https://hub.docker.com/r/staphb/fasttree) | <ul><li>2.1.11</li></ul> | http://www.microbesonline.org/fasttree/ |
| [FastQC](https://hub.docker.com/r/staphb/fastqc) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/fastqc)](https://hub.docker.com/r/staphb/fastqc) | <ul><li>0.11.8</li><li>0.11.9</li></ul> | https://www.bioinformatics.babraham.ac.uk/projects/fastqc/ <br/> https://github.com/s-andrews/FastQC |
| [fastq-scan](https://hub.docker.com/r/staphb/fastq-scan) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/fastq-scan)](https://hub.docker.com/r/staphb/fastq-scan) | <ul><li>0.4.3</li><li>0.4.4</li><li>1.0.0</li></ul> | https://github.com/rpetit3/fastq-scan |
| [Freebayes](https://hub.docker.com/r/staphb/freebayes) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/freebayes)](https://hub.docker.com/r/staphb/freebayes) | <ul><li>1.3.6</li></ul> | https://github.com/freebayes/freebayes |
| [Filtlong](https://hub.docker.com/r/staphb/filtlong) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/filtlong)](https://hub.docker.com/r/staphb/filtlong) | <ul><li>0.2.0</li><li>0.2.1</li></ul> | https://github.com/rrwick/filtlong |
| [FLASH](https://hub.docker.com/r/staphb/flash) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/flash)](https://hub.docker.com/r/staphb/flash) | <ul><li>1.2.11</li></ul> | http://ccb.jhu.edu/software/FLASH | 
| [Flye](https://hub.docker.com/r/staphb/flye) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/flye)](https://hub.docker.com/r/staphb/flye) | <ul><li>2.5</li><li>2.7</li><li>2.8</li><li>2.9</li></ul> | https://github.com/fenderglass/Flye |
| [Freyja](https://hub.docker.com/r/staphb/freyja) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/freyja)](https://hub.docker.com/r/staphb/freyja) | <ul><li>1.2</li><li>1.2.1</li><li>1.3.1</li><li>1.3.2</li><li>1.3.4</li></ul> | https://github.com/andersen-lab/Freyja |
| [GAMBIT](https://hub.docker.com/r/staphb/gambit) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/gambit)](https://hub.docker.com/r/staphb/gambit) | <ul><li>0.3.0</li><li>0.4.0</li></ul> | https://github.com/hesslab-gambit/gambit |
| [GAMMA](https://hub.docker.com/r/staphb/gamma) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/gamma)](https://hub.docker.com/r/staphb/gamma) | <ul><li>1.4</li></ul> | https://github.com/rastanton/GAMMA/ |
| [hmmer](https://hub.docker.com/r/staphb/hmmer) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/hmmer)](https://hub.docker.com/r/staphb/hmmer) | <ul><li>3.3</li></ul> | http://hmmer.org/ |
| [htslib](https://hub.docker.com/r/staphb/htslib) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/htslib)](https://hub.docker.com/r/staphb/htslib) | <ul><li>1.14</li><li>1.15</li></ul> | https://www.htslib.org/ |
| [iqtree](https://hub.docker.com/r/staphb/iqtree/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/iqtree)](https://hub.docker.com/r/staphb/iqtree) | <ul><li>1.6.7</li></ul> | http://www.iqtree.org/ |
| [iqtree2](https://hub.docker.com/r/staphb/iqtree2/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/iqtree2)](https://hub.docker.com/r/staphb/iqtree2) | <ul><li>2.1.2</li></ul> | http://www.iqtree.org/ |
| [IRMA](https://hub.docker.com/r/staphb/irma/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/irma)](https://hub.docker.com/r/staphb/irma) | <ul><li>1.0.2</li></ul> | https://wonder.cdc.gov/amd/flu/irma/|
| [iVar](https://hub.docker.com/r/staphb/ivar/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/ivar)](https://hub.docker.com/r/staphb/ivar) | <ul><li>1.1</li><li>1.1 (+SARS-CoV2 reference)</li><li>1.2.1</li><li>1.2.1 (+SC2 ref)</li><li>1.2.2 (+SC2 ref and artic bedfiles)</li><li>1.3</li><li>1.3.1</li></ul> | https://github.com/andersen-lab/ivar |
| [Kaptive](https://hub.docker.com/r/staphb/kaptive/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/kaptive)](https://hub.docker.com/r/staphb/kaptive) | <ul><li>2.0.0</li><li>2.0.3</li></ul> | https://github.com/katholt/Kaptive/ <br/> https://github.com/katholt/Kaptive/ |
| [Kleborate](https://hub.docker.com/r/staphb/kleborate/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/kleborate)](https://hub.docker.com/r/staphb/kleborate) | <ul><li>2.0.4</li><li>2.1.0</li></ul> | https://github.com/katholt/Kleborate/ <br/> https://github.com/katholt/Kaptive/ |
| [kma](https://hub.docker.com/r/staphb/kma/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/kma)](https://hub.docker.com/r/staphb/kma) | <ul><li>1.2.21</li></ul> | https://bitbucket.org/genomicepidemiology/kma/ |
| [Kraken](https://hub.docker.com/r/staphb/kraken/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/kraken)](https://hub.docker.com/r/staphb/kraken) | <ul><li>1.0</li><li>1.0.0_wslh_signed</li><li>1.1.1</li><li>1.1.1 (no database)</li></ul> | https://github.com/DerrickWood/kraken |
| [Kraken2](https://hub.docker.com/r/staphb/kraken2/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/kraken2)](https://hub.docker.com/r/staphb/kraken2) | <ul><li>2.0.8-beta (no database)</li><li>2.0.8-beta (MiniKraken2_v1_8GB db)</li><li>2.0.8-beta_hv (human + virus db)</li><li>2.0.9-beta (no db)</li><li>2.0.9-beta (Minikraken v2 RefSeq: bacteria, archaea, viral, and human 8GB db)</li><li>2.1.0 (no db)</li><li>2.1.1 (no db)</li><li>2.1.2 (no db)</li></ul> | https://github.com/DerrickWood/kraken2 |
| [kSNP3](https://hub.docker.com/r/staphb/ksnp3/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/ksnp3)](https://hub.docker.com/r/staphb/ksnp3)| <ul><li>3.1</li></ul> | https://sourceforge.net/projects/ksnp/ |
| [legsta](https://hub.docker.com/r/staphb/legsta/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/legsta)](https://hub.docker.com/r/staphb/legsta)| <ul><li>0.3.7</li><li>0.5.1</li></ul> | https://github.com/tseemann/legsta |
| [Lyve-SET (includes CG-Pipeline scripts and raxml)](https://hub.docker.com/r/staphb/lyveset/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/lyveset)](https://hub.docker.com/r/staphb/lyveset) | <ul><li>1.1.4f</li><li>2.0.1</li></ul> | https://github.com/lskatz/lyve-SET https://github.com/lskatz/CG-Pipeline |
| [MAFFT](https://hub.docker.com/r/staphb/mafft/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/mafft)](https://hub.docker.com/r/staphb/mafft)  | <ul><li>7.450</li><li>7.475</li></ul> | https://mafft.cbrc.jp/alignment/software/ |
| [Mash](https://hub.docker.com/r/staphb/mash/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/mash)](https://hub.docker.com/r/staphb/mash)  | <ul><li>2.1</li><li>2.2</li><li>2.3</li></ul> | https://github.com/marbl/Mash |
| [mashtree](https://hub.docker.com/r/staphb/mashtree) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/mashtree)](https://hub.docker.com/r/staphb/mashtree) | <ul><li>0.52.0</li><li>0.57.0</li><li>1.0.4</li><li>1.2.0</li></ul> | https://github.com/lskatz/mashtree |
| [MaSuRCA](https://hub.docker.com/r/staphb/masurca) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/masurca)](https://hub.docker.com/r/staphb/masurca) | <ul><li>4.0.8</li></ul> | https://github.com/alekseyzimin/masurca |
| [medaka](https://hub.docker.com/r/staphb/medaka) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/medaka)](https://hub.docker.com/r/staphb/medaka) | <ul><li>0.8.1</li><li>1.0.1</li><li>1.2.0</li></ul> | https://github.com/nanoporetech/medaka |
| [metaphlan](https://hub.docker.com/r/staphb/metaphlan) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/metaphlan)](https://hub.docker.com/r/staphb/metaphlan) | <ul><li>3.0.3-no-db (no database)</li><li> 3.0.3 (~3GB db) | https://github.com/biobakery/MetaPhlAn/tree/3.0 |
| [minimap2](https://hub.docker.com/r/staphb/minimap2) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/minimap2)](https://hub.docker.com/r/staphb/minimap2) | <ul><li>2.17</li><li>2.18</li><li>2.21</li><li>2.22</li><li>2.23</li><li>2.24</li></ul> | https://github.com/lh3/minimap2 |
| [minipolish](https://hub.docker.com/r/staphb/minipolish) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/minipolish)](https://hub.docker.com/r/staphb/minipolish) | <ul><li>0.1.3</li></ul> | https://github.com/rrwick/Minipolish |
| [mlst](https://hub.docker.com/r/staphb/mlst) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/mlst)](https://hub.docker.com/r/staphb/mlst) | <ul><li>2.16.2</li><li>2.17.6</li><li>2.19.0</li><li>2.22.0</li></ul> | https://github.com/tseemann/mlst |
| [Mugsy](https://hub.docker.com/r/staphb/mugsy) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/mugsy)](https://hub.docker.com/r/staphb/mugsy) | <ul><li>1r2.3</li></ul> | http://mugsy.sourceforge.net/ |
| [MultiQC](https://hub.docker.com/r/staphb/multiqc) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/multiqc)](https://hub.docker.com/r/staphb/multiqc) | <ul><li>1.7</li><li>1.8</li></ul> | https://github.com/ewels/MultiQC |
| [Mummer](https://hub.docker.com/r/staphb/mummer) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/mummer)](https://hub.docker.com/r/staphb/mummer) | <ul><li>4.0.0</li></ul> | https://github.com/mummer4/mummer | 
| [NanoPlot](https://hub.docker.com/r/staphb/nanoplot) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/nanoplot)](https://hub.docker.com/r/staphb/nanoplot) | <ul><li>1.27.0</li><li>1.29.0</li><li>1.30.1</li><li>1.32.0</li><li>1.33.0</li></ul> | https://github.com/wdecoster/NanoPlot |
| [ngmaster](https://hub.docker.com/r/staphb/ngmaster) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/ngmaster)](https://hub.docker.com/r/staphb/ngmaster) | <ul><li>0.5.8</li></ul> | https://github.com/MDU-PHL/ngmaster |
| [NCBI AMRFinderPlus](https://hub.docker.com/r/staphb/ncbi-amrfinderplus) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/ncbi-amrfinderplus)](https://hub.docker.com/r/staphb/ncbi-amrfinderplus) | <ul><li>3.1.1b</li><li>3.8.4</li><li>3.8.28</li><li>3.9.3</li><li>3.9.8</li><li>3.10.1</li><li>3.10.5</li><li>3.10.16</li><li>3.10.20</li><li>3.10.24</li></ul> | [https://github.com/ncbi/amr](https://github.com/ncbi/amr) |
| [OrthoFinder](https://hub.docker.com/r/staphb/OrthoFinder) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/orthofinder)](https://hub.docker.com/r/staphb/orthofinder) | <ul><li>2.17</li></ul> | https://github.com/davidemms/OrthoFinder |
| [Pangolin](https://hub.docker.com/r/staphb/pangolin) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/pangolin)](https://hub.docker.com/r/staphb/pangolin) | <details><summary> Click to see Pangolin v3 and older versions! </summary> **Pangolin version & pangoLEARN data release date** <ul><li>1.1.14</li><li>2.0.4 & 2020-07-20</li><li>2.0.5 & 2020-07-20</li><li>2.1.1 & 2020-12-17</li><li>2.1.3 & 2020-12-17</li><li>2.1.6 & 2021-01-06</li><li>2.1.7 & 2021-01-11</li><li>2.1.7 & 2021-01-20</li><li>2.1.8 & 2021-01-22</li><li>2.1.10 & 2021-02-01</li><li>2.1.11 & 2021-02-01</li><li>2.1.11 & 2021-02-05</li><li>2.2.1 & 2021-02-06</li><li>2.2.2 & 2021-02-06</li><li>2.2.2 & 2021-02-11</li><li>2.2.2 & 2021-02-12</li><li>2.3.0 & 2021-02-12</li><li>2.3.0 & 2021-02-18</li><li>2.3.0 & 2021-02-21</li><li>2.3.2 & 2021-02-21</li><li>2.3.3 & 2021-03-16</li><li>2.3.4 & 2021-03-16</li><li>2.3.5 & 2021-03-16</li><li>2.3.6 & 2021-03-16</li><li>2.3.6 & 2021-03-29</li><li>2.3.8 & 2021-04-01</li><li>2.3.8 & 2021-04-14</li><li>2.3.8 & 2021-04-21</li><li>2.3.8 & 2021-04-23</li><li>2.4 & 2021-04-28</li><li>2.4.1 & 2021-04-28</li><li>2.4.2 & 2021-04-28</li><li>2.4.2 & 2021-05-10</li><li>2.4.2 & 2021-05-11</li><li>2.4.2 & 2021-05-19</li><li>3.0.5 & 2021-06-05</li><li>3.1.3 & 2021-06-15</li><li>3.1.5 & 2021-06-15</li><li>3.1.5 & 2021-07-07-2</li><li>3.1.7 & 2021-07-09</li><li>3.1.8 & 2021-07-28</li><li>3.1.10 & 2021-07-28</li><li>3.1.11 & 2021-08-09</li><li>3.1.11 & 2021-08-24</li><li>3.1.11 & 2021-09-17</li><li>3.1.14 & 2021-09-28</li><li>3.1.14 & 2021-10-13</li><li>3.1.16 & 2021-10-18</li><li>3.1.16 & 2021-11-04</li><li>3.1.16 & 2021-11-09</li><li>3.1.16 & 2021-11-18</li><li>3.1.16 & 2021-11-25</li><li>3.1.17 & 2021-11-25</li><li>3.1.17 & 2021-12-06</li><li>3.1.17 & 2022-01-05</li><li>3.1.18 & 2022-01-20</li><li>3.1.19 & 2022-01-20</li><li>3.1.20 & 2022-02-02</li><li>3.1.20 & 2022-02-28</li></ul> </details> **Pangolin version & pangolin-data version** </br><ul><li>4.0 & 1.2.133</li><li>4.0.1 & 1.2.133</li><li>4.0.2 & 1.2.133</li><li>4.0.3 & 1.2.133</li><li>4.0.4 & 1.2.133</li><li>4.0.5 & 1.3</li><li>4.0.6 & 1.6</li><li>4.0.6 & 1.8</li></ul> |  https://github.com/cov-lineages/pangolin<br/>https://github.com/cov-lineages/pangoLEARN<br/>https://github.com/cov-lineages/pango-designation<br/>https://github.com/cov-lineages/scorpio<br/>https://github.com/cov-lineages/constellations<br/>https://github.com/cov-lineages/lineages (archived)<br/>https://github.com/hCoV-2019/pangolin (archived) |
| [parallel-perl](https://hub.docker.com/r/staphb/parallel-perl) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/parallel-perl)](https://hub.docker.com/r/staphb/parallel-perl) | <ul><li>20200722</li></ul> | https://www.gnu.org/software/parallel |
| [Phyml](https://hub.docker.com/r/staphb/phyml) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/phyml)](https://hub.docker.com/r/staphb/phyml) | <ul><li>3.3.20220408</li></ul> | https://github.com/stephaneguindon/phyml |
| [Piggy](https://hub.docker.com/r/staphb/piggy) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/piggy)](https://hub.docker.com/r/staphb/piggy) | <ul><li>1.5</li></ul> | https://github.com/harry-thorpe/piggy |
| [Pilon](https://hub.docker.com/r/staphb/pilon) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/pilon)](https://hub.docker.com/r/staphb/pilon) | <ul><li>1.23.0</li></ul> | https://github.com/broadinstitute/pilon |
| [PlasmidSeeker](https://hub.docker.com/r/staphb/plasmidseeker) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/plasmidseeker)](https://hub.docker.com/r/staphb/plasmidseeker) | <ul><li>1.0</li></ul> | https://github.com/bioinfo-ut/PlasmidSeeker |
| [pmga](https://hub.docker.com/r/staphb/pmga/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/pmga)](https://hub.docker.com/r/staphb/pmga) | <ul><li>3.0.2</li></ul> | https://github.com/rpetit3/pmga |
| [Prokka](https://hub.docker.com/r/staphb/prokka/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/prokka)](https://hub.docker.com/r/staphb/prokka) | <ul><li>1.13.4</li><li>1.14.0</li><li>1.14.5</li></ul> | https://github.com/tseemann/prokka |
| [QUAST](https://hub.docker.com/r/staphb/quast/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/quast)](https://hub.docker.com/r/staphb/quast) | <ul><li>5.0.0</li><li>5.0.2</li></ul> | https://github.com/ablab/quast |
| [racon](https://hub.docker.com/r/staphb/racon) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/racon)](https://hub.docker.com/r/staphb/racon)| <ul><li>1.4.3</li><li>1.4.20</li></ul> |  https://github.com/lbcb-sci/racon <br/> https://github.com/isovic/racon (ARCHIVED) |
| [rasusa](https://hub.docker.com/r/staphb/rasusa/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/rasusa)](https://hub.docker.com/r/staphb/rasusa) | <ul><li>0.1.0</li><li>0.2.0</li><li>0.3.0</li><li>0.6.0</li></ul> | https://github.com/mbhall88/rasusa |
| [raven](https://hub.docker.com/r/staphb/raven/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/raven)](https://hub.docker.com/r/staphb/raven) | <ul><li>1.5.1</li></ul> | https://github.com/lbcb-sci/raven |
| [RAxML](https://hub.docker.com/r/staphb/raxml/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/raxml)](https://hub.docker.com/r/staphb/raxml) | <ul><li>8.2.12 (RAxML) and 0.9.0 (RAxML Next Generation)</li></ul> | https://github.com/stamatak/standard-RAxML <br/> https://github.com/amkozlov/raxml-ng |
| [Roary](https://hub.docker.com/r/staphb/roary/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/roary)](https://hub.docker.com/r/staphb/roary) | <ul><li>3.12.0</li><li>3.13.0</li></ul> | https://github.com/sanger-pathogens/Roary |
| [SalmID](https://hub.docker.com/r/staphb/salmid) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/salmid)](https://hub.docker.com/r/staphb/salmid) | <ul><li>0.1.23</li></ul> | https://github.com/hcdenbakker/SalmID |
| [Samtools](https://hub.docker.com/r/staphb/samtools) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/samtools)](https://hub.docker.com/r/staphb/samtools) | <ul><li>1.9</li><li>1.10</li><li>1.11</li><li>1.12</li><li>1.13</li><li>1.14</li><li>1.15</li></ul> | https://github.com/samtools/samtools |
| [SeqSero](https://hub.docker.com/r/staphb/seqsero/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/seqsero)](https://hub.docker.com/r/staphb/seqsero) | <ul><li>1.0.1</li></ul> | https://github.com/denglab/SeqSero |
| [SeqSero2](https://hub.docker.com/r/staphb/seqsero2/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/seqsero2)](https://hub.docker.com/r/staphb/seqsero2) | <ul><li>0.1.0</li><li>1.0.0</li><li>1.0.2</li><li>1.1.0</li><li>1.1.1</li><li>1.2.1</li></ul> | https://github.com/denglab/SeqSero2/ |
| [seqtk](https://hub.docker.com/r/staphb/seqtk) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/seqtk)](https://hub.docker.com/r/staphb/seqtk) | <ul><li>1.3</li></ul> | https://github.com/lh3/seqtk |
| [seqyclean](https://hub.docker.com/r/staphb/seqyclean) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/seqyclean)](https://hub.docker.com/r/staphb/seqyclean) | <ul><li>1.10.09</li></ul> | https://github.com/ibest/seqyclean |
| [Seroba](https://hub.docker.com/r/staphb/seroba) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/seroba)](https://hub.docker.com/r/staphb/seroba) | <ul><li>1.0.0</li><li>1.0.2</li><li>1.0.2_wslh_signed</li></ul> | https://github.com/sanger-pathogens/seroba |
| [SerotypeFinder](https://hub.docker.com/r/staphb/serotypefinder/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/serotypefinder)](https://hub.docker.com/r/staphb/serotypefinder) | <ul><li>1.1 (perl version)</li><li>2.0.1 (python version)</li></ul> | https://bitbucket.org/genomicepidemiology/serotypefinder/ |
| [shigatyper](https://hub.docker.com/r/staphb/shigatyper/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/shigatyper)](https://hub.docker.com/r/staphb/shigatyper) | <ul><li>2.0.1</li></ul> | https://github.com/CFSAN-Biostatistics/shigatyper|
| [Shovill](https://hub.docker.com/r/staphb/shovill/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/shovill)](https://hub.docker.com/r/staphb/shovill) | <ul><li>1.0.4</li><li>1.1.0</li></ul> | https://github.com/tseemann/shovill |
| [Shovill-se](https://hub.docker.com/r/staphb/shovill-se/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/shovill-se)](https://hub.docker.com/r/staphb/shovill-se) | <ul><li>1.1.0</li></ul> | https://github.com/rpetit3/shovill/tree/v1.1.0se |
| [SISTR](https://hub.docker.com/r/staphb/sistr/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/sistr)](https://hub.docker.com/r/staphb/sistr) | <ul><li>1.0.2</li><li>1.1.1</li></ul> | https://github.com/phac-nml/sistr_cmd |
| [SKESA](https://hub.docker.com/r/staphb/skesa) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/skesa)](https://hub.docker.com/r/staphb/skesa) | <ul><li>2.3.0</li><li>2.4.0 (`gfa_connector` & `kmercounter` included)</li></ul> | https://github.com/ncbi/SKESA |
| [Smalt](https://hub.docker.com/r/staphb/smalt) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/smalt)](https://hub.docker.com/r/staphb/smalt) | <ul><li>0.7.6</li></ul> | https://www.sanger.ac.uk/tool/smalt-0/ |
| [Snippy](https://hub.docker.com/r/staphb/snippy) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/snippy)](https://hub.docker.com/r/staphb/snippy) | <ul><li>4.4.5</li><li>4.5.1</li><li>4.6.0</li></ul> | https://github.com/tseemann/snippy |
| [snp-dists](https://hub.docker.com/r/staphb/snp-dists) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/snp-dists)](https://hub.docker.com/r/staphb/snp-dists) | <ul><li>0.6.2</li><li>0.8.2</li></ul> | https://github.com/tseemann/snp-dists |
| [SNP-sites](https://hub.docker.com/r/staphb/snp-sites) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/snp-sites)](https://hub.docker.com/r/staphb/snp-sites) | <ul><li>2.3.3</li><li>2.5.1</li></ul> | https://github.com/sanger-pathogens/snp-sites |
| [SNVPhyl-tools](https://hub.docker.com/r/staphb/snvphyl-tools) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/snvphyl-tools)](https://hub.docker.com/r/staphb/snvphyl-tools) | <ul><li>1.8.2</li></ul> | https://github.com/phac-nml/snvphyl-tools |
| [SPAdes](https://hub.docker.com/r/staphb/spades/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/spades)](https://hub.docker.com/r/staphb/spades) | <ul><li>3.8.2</li><li>3.12.0</li><li>3.13.0</li><li>3.14.0</li><li>3.14.1</li><li>3.15.0</li><li>3.15.1</li><li>3.15.2</li><li>3.15.3</li><li>3.15.4</li></ul> | https://github.com/ablab/spades </br> http://cab.spbu.ru/software/spades/ |
| [SRA-toolkit](https://hub.docker.com/r/staphb/sratoolkit/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/sratoolkit)](https://hub.docker.com/r/staphb/sratoolkit) | <ul><li>2.9.2</li></ul> | https://github.com/ncbi/sra-tools |
| [Staramr](https://hub.docker.com/r/staphb/staramr/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/staramr)](https://hub.docker.com/r/staphb/staramr) | <ul><li>0.5.1</li><li>0.7.1</li></ul> | https://github.com/phac-nml/staramr |
| [TipToft](https://hub.docker.com/r/staphb/tiptoft/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/tiptoft)](https://hub.docker.com/r/staphb/tiptoft) | <ul><li>1.0.0</li><li>1.0.2</li></ul> | https://github.com/andrewjpage/tiptoft |
| [Treemmer](https://hub.docker.com/r/staphb/treemmer/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/treemmer)](https://hub.docker.com/r/staphb/treemmer) | <ul><li>0.3</li></ul> | https://git.scicore.unibas.ch/TBRU/Treemmer (archived, moved to GitHub) </br> https://github.com/fmenardo/Treemmer |
| [Trimmomatic](https://hub.docker.com/r/staphb/trimmomatic/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/trimmomatic)](https://hub.docker.com/r/staphb/trimmomatic) | <ul><li>0.38</li><li>0.39</li></ul> | http://www.usadellab.org/cms/?page=trimmomatic </br>https://github.com/usadellab/Trimmomatic |
| [Trycycler](https://hub.docker.com/r/staphb/trycycler/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/trycycler)](https://hub.docker.com/r/staphb/trycycler) | <ul><li>0.3.1</li><li>0.3.2</li><li>0.3.3</li><li>0.5.0</li></ul> | https://github.com/rrwick/Trycycler |
| [Unicycler](https://hub.docker.com/r/staphb/unicycler/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/unicycler)](https://hub.docker.com/r/staphb/unicycler) | <ul><li>0.4.7</li><li>0.4.8</li><li>0.4.9</li></ul> | https://github.com/rrwick/Unicycler |
| [VADR](https://hub.docker.com/r/staphb/vadr/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/vadr)](https://hub.docker.com/r/staphb/vadr) | <ul><li>1.1</li><li>1.1.2</li><li>1.1.3</li><li>1.2</li><li>1.2.1</li><li>1.3 & SARS-CoV-2 models 1.3-1</li><li>1.3 & SARS-CoV-2 models 1.3-2</li><li>1.4 & SARS-CoV-2 models 1.3-2</li><li>1.4.1 & SARS-CoV-2 models 1.3-2</li></ul> | https://github.com/nawrockie/vadr (archived, now redirects to ncbi/vadr) </br>https://github.com/ncbi/vadr |
| [VIBRANT](https://hub.docker.com/r/staphb/vibrant/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/vibrant)](https://hub.docker.com/r/staphb/vibrant) | <ul><li>1.2.1</li></ul> | https://github.com/AnantharamanLab/VIBRANT |
| [VIGOR4](https://hub.docker.com/r/staphb/vigor4/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/vigor4)](https://hub.docker.com/r/staphb/vigor4) | <ul><li>4.1.20190131</li></ul> | https://github.com/JCVenterInstitute/VIGOR4 |
| [VirSorter2](https://hub.docker.com/r/staphb/virsorter2/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/virsorter2)](https://hub.docker.com/r/staphb/virsorter2/) | <ul><li>2.1</li></ul> | https://github.com/jiarong/VirSorter2 |
| [wtdbg2](https://hub.docker.com/r/staphb/wtdbg2/) <br/> [![docker pulls](https://badgen.net/docker/pulls/staphb/wtdbg2)](https://hub.docker.com/r/staphb/wtdbg2) | <ul><li>2.5</li></ul> | https://github.com/ruanjue/wtdbg2 |

You can also view the list of images on Docker hub here: https://hub.docker.com/r/staphb/

## License
  * [GNU GPLv3 license](/LICENSE) was added 2020-01-16
  * We keep a list of the licenses for the main software within the docker images here: [Program_Licenses.md](/Program_Licenses.md)
  * Links to licenses for each program should also be listed as a metadata `LABEL` within each dockerfile

## Authors/Maintainers
Each Dockerfile lists the author(s)/maintainer(s) as a metadata `LABEL`, but the authors/maintainers of the docker images are:
  * [@kapsakcj](https://github.com/kapsakcj)
  * [@k-florek](https://github.com/k-florek)
  * [@garfinjm](https://github.com/garfinjm)
  * [@kevinlibuit](https://github.com/kevinlibuit)
  * [@erinyoung](https://github.com/erinyoung)
  * [@lskatz](https://github.com/lskatz)
  * [@stjacqrm](https://github.com/stjacqrm)
  * [@AbigailShockey](https://github.com/AbigailShockey)
  * [@andersgs](https://github.com/andersgs)
  * [@logan-fink](https://github.com/logan-fink)
  * [@tgallagh](https://github.com/tgallagh)
  * [@koakeson](https://github.com/koakeson)
  * [@joacjo](https://github.com/joacjo)
  * [@rpetit3](https://github.com/rpetit3/)
  * [@jvhagey](https://github.com/jvhagey)
  * [@Antonia-Chalka](https://github.com/Antonia-Chalka)
  * [@MillironX](https://github.com/MillironX)
  * [@frankambrosio3](https://github.com/frankambrosio3)
  * [@HNHalstead](https://github.com/HNHalstead)
  * [@fanninpm](https://github.com/fanninpm)
  * [@SarahNadeau](https://github.com/SarahNadeau)
  * [@DOH-HNH0303](https://github.com/DOH-HNH0303)
  * [@jwarnn](https://github.com/jwarnn)
  * [@stitam](https://github.com/stitam)
