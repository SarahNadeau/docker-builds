ARG BBTOOLS_VER=38.94

FROM ubuntu:xenial as app
ARG BBTOOLS_VER

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="2"
LABEL software="BBTools"
LABEL software.version=$BBTOOLS_VER
LABEL description="A set of tools labeled as \"Bestus Bioinformaticus\""
LABEL website="https://jgi.doe.gov/data-and-tools/software-tools/bbtools/"
LABEL license="https://jgi.doe.gov/disclaimer/"
LABEL maintainer="Abigail Shockey"
LABEL maintainer.email="abigail.shockey@slh.wisc.edu"
LABEL maintainer2="Padraic Fanning"
LABEL maintainer2.email="faninnpm AT miamioh DOT edu"

RUN apt-get update && apt-get install -y build-essential \
    openjdk-8-jre-headless \
    wget && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoclean

# get miniconda and the artic-ncov19 repo
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash ./Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b  && \
    rm Miniconda3-latest-Linux-x86_64.sh

# set the environment
ENV PATH="/miniconda/bin:$PATH"

RUN conda config --add channels defaults && \
    conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda install sambamba samtools && \
    conda clean -a -y

RUN wget https://sourceforge.net/projects/bbmap/files/BBMap_$BBTOOLS_VER.tar.gz && \
    tar -xzf BBMap_$BBTOOLS_VER.tar.gz && \
    rm BBMap_$BBTOOLS_VER.tar.gz

ENV PATH="${PATH}:/bbmap"\
    LC_ALL=C

WORKDIR /data

FROM app as test
ARG BBTOOLS_VER

# Run test script
COPY test.sh .
RUN bash test.sh $BBTOOLS_VER
