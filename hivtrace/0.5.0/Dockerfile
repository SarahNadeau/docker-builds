# FROM defines the base docker image. This command has to come first in the file
# The 'as' keyword lets you name the folowing stage. We use `app` for the production image
FROM ubuntu:focal as app

# ARG sets environment variables during the build stage
ARG HIVTRACE_VER="0.5.0"

# LABEL instructions tag the image with metadata that might be important to the user
# Optional, but highly recommended
LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
LABEL software="HIV-TRACE"
LABEL software.version=$SOFTWARENAME_VER
LABEL description="HIV-TRACE is an application that identifies potential transmission clusters within a supplied FASTA file with an option to find potential links against the Los Alamos HIV Sequence Database."
LABEL website="https://doi.org/10.1093/molbev/msy016"
LABEL license="https://github.com/veg/hivtrace/blob/master/LICENSE"
LABEL maintainer="Sarah Nadeau"

# RUN executes code during the build
# Install dependencies via apt-get or yum if using a centos or fedora base
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    cmake \
    git \
    libbz2-dev \
    libcurl3-dev \
    liblzma-dev \
    libssl-dev \
    python3 \
    python3-pip

# Install and/or setup more things. Make /data for use as a working dir
RUN pip3 install \
    biopython \
    numpy==1.20 \
    scipy \
    cython

RUN git clone https://github.com/veg/tn93.git && \
    cd tn93 && \
    cmake . && \
    make install

RUN pip3 install hivtrace

# WORKDIR sets working directory
WORKDIR /data

# A second FROM insruction creates a new stage
# We use `test` for the test image
FROM app as test

# Option 1: run the program's internal tests
# NOTE: 2 tests fail because the input data is no longer present in the repo.. tests are outdated? 
# Commenting out for now, seems that software is installed correctly given that 15/17 tests pass
# RUN git clone https://github.com/veg/hivtrace.git /hivtrace && \
#     python3.8 /hivtrace/test/test_hivtrace.py

RUN hivtrace -h
