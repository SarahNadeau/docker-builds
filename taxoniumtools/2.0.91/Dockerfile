# FROM defines the base docker image. This command has to come first in the file
# The 'as' keyword lets you name the folowing stage. We use `app` for the production image
FROM ubuntu:focal as app

# ARG sets environment variables during the build stage
ARG TAXONIUMTOOLS_VER="2.0.91"

# LABEL instructions tag the image with metadata that might be important to the user
# Optional, but highly recommended
LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
LABEL software="Taxoniumtools"
LABEL software.version=$TAXONIUMTOOLS_VER
LABEL description="Taxonium tools is a Python utility that allows you to generate Taxonium format files from UShER mutation-annoated trees."
LABEL website="https://docs.taxonium.org/en/latest/taxoniumtools.html"
LABEL license="https://github.com/theosanderson/taxonium/tree/master/taxoniumtools"
LABEL maintainer="Sarah Nadeau"

# RUN executes code during the build
# Install dependencies via apt-get or yum if using a centos or fedora base
RUN apt-get update && apt-get install -y \
 python3 \
 python3-pip

# Install and/or setup more things. Make /data for use as a working dir
# Example: ncbi-blast+ 2.9.0
RUN pip3 install taxoniumtools

# WORKDIR sets working directory
WORKDIR /data

# A second FROM insruction creates a new stage
# We use `test` for the test image
FROM app as test

RUN apt-get install -y wget

# Demonstrate that the program is successfully installed
RUN wget https://github.com/theosanderson/taxonium/raw/master/taxoniumtools/test_data/tfci.meta.tsv.gz && \
    wget https://raw.githubusercontent.com/theosanderson/taxonium/master/taxoniumtools/test_data/hu1.gb && \
    wget https://github.com/theosanderson/taxonium/raw/master/taxoniumtools/test_data/tfci.pb

RUN usher_to_taxonium \
    --input tfci.pb \
    --output tfci-taxonium.jsonl.gz \
    --metadata tfci.meta.tsv.gz \
    --genbank hu1.gb \
    --columns genbank_accession,country,date,pangolin_lineage
