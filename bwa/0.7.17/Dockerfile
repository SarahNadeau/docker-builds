FROM ubuntu:xenial as app

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="2"
LABEL software="BWA"
LABEL software.version=$BWA_VER
LABEL description="Burrows-Wheeler Aligner for short-read alignment"
LABEL website="https://github.com/lh3/bwa"
LABEL license="https://github.com/lh3/bwa/blob/master/COPYING"
LABEL maintainer="Curtis Kapsak"
LABEL maintainer.email="pjx8@cdc.gov"
LABEL dockerfile.version="2"

RUN apt-get update && apt-get install -y --no-install-recommends \
 wget \
 make \
 gcc \
 zlib1g-dev \
 bzip2 \
 ca-certificates \
 procps && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN mkdir bwa &&\
  mkdir /data &&\
  cd bwa &&\
  wget https://github.com/lh3/bwa/releases/download/v$BWA_VER/bwa-$BWA_VER.tar.bz2 &&\
  tar -xjf bwa-$BWA_VER.tar.bz2 &&\
  rm bwa-$BWA_VER.tar.bz2 &&\
  cd bwa-$BWA_VER &&\
  make

ENV PATH="${PATH}:/bwa/bwa-$BWA_VER"
WORKDIR /data

FROM app as test

RUN wget "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=5&rettype=fasta" \
    -o "sequence.fasta" &&\
    bwa index "sequence.fasta"
