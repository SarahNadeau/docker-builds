ARG SAMTOOLS_VER=1.9

FROM ubuntu:xenial as app
ARG SAMTOOLS_VER

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="2"
LABEL software="Samtools"
LABEL software.version=$SAMTOOLS_VER
LABEL description="Tools (written in C using htslib) for manipulating next-generation sequencing data"
LABEL website="https://github.com/samtools/samtools"
LABEL license="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL maintainer="Curtis Kapsak"
LABEL maintainer.email="pjx8@cdc.gov"

RUN apt-get update && apt-get install -y libncurses5-dev \
  libbz2-dev \
  liblzma-dev \
  libcurl4-gnutls-dev \
  zlib1g-dev \
  libssl-dev \
  gcc \
  wget \
  make \
  perl \
  bzip2

RUN mkdir samtools &&\
  mkdir data &&\
  cd samtools &&\
  wget https://github.com/samtools/samtools/releases/download/$SAMTOOLS_VER/samtools-$SAMTOOLS_VER.tar.bz2 &&\
  tar -xjf samtools-$SAMTOOLS_VER.tar.bz2 &&\
  rm samtools-$SAMTOOLS_VER.tar.bz2 &&\
  cd samtools-$SAMTOOLS_VER &&\
  ./configure &&\
  make &&\
  make install

# set perl locale settings
ENV LC_ALL=C

WORKDIR /data

FROM app as test
ARG SAMTOOLS_VER

# Run test script
COPY test.sh .
RUN bash test.sh $SAMTOOLS_VER
