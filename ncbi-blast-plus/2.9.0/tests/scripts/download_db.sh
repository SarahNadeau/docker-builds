#!/bin/bash
# This script is to download and extract the NCBI database 16S_ribosomal_RNA.

echo "Downloading database"
WORKDIR="$pwd"
mkdir -p /db && cd /db
update_blastdb.pl 16S_ribosomal_RNA
tar -xvf 16S_ribosomal_RNA.tar.gz
cd $WORKDIR