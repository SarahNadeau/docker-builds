FROM ubuntu:xenial as app

LABEL base.image="ubuntu:xenial"
LABEL version="1"
LABEL software="BWA"
LABEL software.version="0.7.17"
LABEL description="Burrow-Wheeler Aligner for short-read alignment"
LABEL website="https://github.com/lh3/bwa"
LABEL license="https://github.com/lh3/bwa/blob/master/COPYING"
LABEL maintainer="Curtis Kapsak"
LABEL maintainer.email="pjx8@cdc.gov"

RUN apt-get update && apt-get install -y make \
  wget \
  gcc \
  zlib1g-dev \
  bzip2

RUN mkdir bwa &&\
  mkdir /data &&\
  cd bwa &&\
  wget https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2 &&\
  tar -xjf bwa-0.7.17.tar.bz2 &&\
  rm bwa-0.7.17.tar.bz2 &&\
  cd bwa-0.7.17 &&\
  make

ENV PATH="${PATH}:/bwa/bwa-0.7.17"
WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY bwa/0.7.17/tests /tests
RUN mkdir -p /test_data/asm && mkdir -p /test_data/trim_reads

# Copy uncorrected assembly
COPY test_data/asm/contigs.fasta /test_data/asm/SRR5481494_sub.uncorrected.fna
# Copy corrected assembly
COPY test_data/asm/SRR5481494_sub.fasta /test_data/asm/
# Copy read files (pairs, merged pairs, and singles)
COPY test_data/trim_reads/SRR5481494_sub.notCombined_*.fastq.gz /test_data/trim_reads/
COPY test_data/trim_reads/SRR5481494_sub.extendedFrags.fastq.gz /test_data/trim_reads/
COPY test_data/trim_reads/SRR5481494_sub_R*.unpaired.fq.gz /test_data/trim_reads/

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests
