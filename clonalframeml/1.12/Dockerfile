FROM ubuntu:xenial as app

ARG CLONALFRAMEML_VER="1.12"

LABEL base.image="ubuntu:xenial"
LABEL software="ClonalFrameML"
LABEL software.version=${CLONALFRAMEML_VER}
LABEL description="ClonalFrameML: Maximum-likelihood inference of recombination in bacterial genomes."
LABEL website="https://github.com/xavierdidelot/ClonalFrameML"
LABEL license.url="https://github.com/xavierdidelot/ClonalFrameML/blob/master/LICENSE"

# Update package index, install packages for building from source
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    software-properties-common \
    dirmngr \
    apt-transport-https

# Install ClonalFrameML from source
WORKDIR /
RUN wget https://github.com/xavierdidelot/ClonalFrameML/archive/refs/tags/v$CLONALFRAMEML_VER.tar.gz \
    && tar xvf v$CLONALFRAMEML_VER.tar.gz \
    && rm v$CLONALFRAMEML_VER.tar.gz
WORKDIR /ClonalFrameML-$CLONALFRAMEML_VER/src
RUN make

# Rename for ease of calling associated R scripts
RUN mv /ClonalFrameML-$CLONALFRAMEML_VER/ /ClonalFrameML/

# Install R from CRAN (thanks: https://linuxize.com/post/how-to-install-r-on-ubuntu-20-04/)
# Add GPG key to trust the repository
# Pull R 4.X.X for ubuntu 16.04 (xenial) & update package repository accordingly
# Install R
# Add the R 4.0 or later ‘c2d4u’ repository
# Install the ape and phangorn R packages.
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
    && add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran40/" \
    && apt update \
    && apt install -y r-base \
    && add-apt-repository ppa:c2d4u.team/c2d4u4.0+ \
    && apt update \
    && apt install -y \
    r-cran-ape \
    r-cran-phangorn

ENV PATH=/ClonalFrameML/src/:$PATH

RUN mkdir -p /data
WORKDIR /data

FROM app as test

ENV PATH=/ClonalFrameML/src/:$PATH

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY clonalframeml/1.12/tests /tests

# Copy test data
COPY test_data/alignment/aln/parsnp.tree /test_data/
COPY test_data/alignment/aln/parsnp.xmfa /test_data/
COPY test_data/alignment/aln/core_genome.fasta /test_data/parsnp.fasta

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
#RUN python3 -m unittest discover -s /tests
