
# FROM defines the base docker image. This command has to come first in the file
# The 'as' keyword lets you name the folowing stage. We use `app` for the production image
FROM ubuntu:focal as app

# ARG sets environment variables during the build stage
ARG TREETIME_VER="0.9.4"

# LABEL instructions tag the image with metadata that might be important to the user
# Optional, but highly recommended
LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
LABEL software="TreeTime"
LABEL software.version=$TREETIME_VER
LABEL description="TreeTime provides routines for ancestral sequence reconstruction and inference of molecular-clock phylogenies"
LABEL website="https://treetime.readthedocs.io/en/latest/index.html"
LABEL license="https://github.com/neherlab/treetime/blob/master/LICENSE"
LABEL maintainer="Sarah Nadeau"

# RUN executes code during the build
# Install dependencies via apt-g
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  wget \
  build-essential

# Install software
RUN wget https://github.com/neherlab/treetime/archive/refs/tags/v${TREETIME_VER}.tar.gz && \
    tar -xzvf v${TREETIME_VER}.tar.gz && \
    rm v${TREETIME_VER}.tar.gz && \
    cd treetime-0.9.4 && \
    python3.8 -m pip install .

# WORKDIR sets working directory
WORKDIR /data

# A second FROM insruction creates a new stage
# We use `test` for the test image
FROM app as test

# Install test dependencies
RUN apt-get update && apt-get install -y git
RUN pip3 install pytest

# Demonstrate that the program is successfully installed
# Option 1: run the program's internal tests
RUN cd /treetime-0.9.4; bash test.sh
