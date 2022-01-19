# to make it easier to upgrade for new versions; ARG variables only persist during docker image build time
ARG SPAdesVer=3.15.3

FROM ubuntu:xenial as app
ARG SPAdesVer

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="1"
LABEL software="SPAdes"
LABEL software.version="3.15.3"
LABEL description="de novo DBG genome assembler"
LABEL website="https://github.com/ablab/spades"
LABEL license="https://github.com/ablab/spades/blob/v3.15.3/assembler/LICENSE"
LABEL maintainer="Curtis Kapsak"
LABEL maintainer.email="kapsakcj@gmail.com"

# install dependencies; cleanup apt garbage
# python v2.7.12 is installed here
RUN apt-get update && apt-get install -y python \
 wget && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/* 

# install SPAdes binary; make /data
RUN wget http://cab.spbu.ru/files/release${SPAdesVer}/SPAdes-${SPAdesVer}-Linux.tar.gz && \
  tar -xzf SPAdes-${SPAdesVer}-Linux.tar.gz && \
  rm -r SPAdes-${SPAdesVer}-Linux.tar.gz && \
  mkdir /data

# set PATH and locale settings for singularity
ENV LC_ALL=C \
    PATH="${PATH}:/SPAdes-${SPAdesVer}-Linux/bin"

WORKDIR /data

FROM app as test
ARG SPAdesVer

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY spades/$SPAdesVer/tests /tests
COPY test_data/trim_reads/SRR5481494_sub.extendedFrags.fastq.gz /test_data/trim_reads/
COPY test_data/trim_reads/SRR5481494_sub.notCombined_*.fastq.gz /test_data/trim_reads/

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests

# Test with: docker build --progress=plain --target=test -t spades-test-image -f spades/3.15.3/Dockerfile --build-arg RAMSIZE_TOT=2 .