FROM ubuntu:xenial as app

LABEL base.image="ubuntu:xenial"
LABEL version="1"
LABEL software="Samtools"
LABEL software.version="1.9"
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
  wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 &&\
  tar -xjf samtools-1.9.tar.bz2 &&\
  rm samtools-1.9.tar.bz2 &&\
  cd samtools-1.9 &&\
  ./configure &&\
  make &&\
  make install

# set perl locale settings
ENV LC_ALL=C

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY samtools/1.9/tests /tests
RUN mkdir -p /test_data/asm
# Copy reference genomes
COPY test_data/asm/contigs.fasta /test_data/asm/SRR5481494_sub.uncorrected.fna
COPY test_data/asm/SRR5481494_sub.fasta /test_data/asm/
# Copy alignments
COPY test_data/asm/SRR5481494_sub.paired.sam /test_data/asm
COPY test_data/asm/SRR5481494_sub.single.sam /test_data/asm

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests