#!/bin/bash

docker pull snads/parsnp

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/997/265/GCF_001997265.1_ASM199726v1/GCF_001997265.1_ASM199726v1_genomic.fna.gz

docker run --rm -v $PWD:/data -u $(id -u):$(id -g) snads/parsnp:1.5.6 parsnp \
-d . \
-o outdir_parsnp \
--use-fasttree \
-v \
-c \
-r !

