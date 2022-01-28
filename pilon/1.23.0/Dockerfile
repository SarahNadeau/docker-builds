FROM ubuntu:xenial as app

# metadata
LABEL base.image="ubuntu:xenial"
LABEL version="1"
LABEL software="pilon"
LABEL software.version="1.23.0"
LABEL description="Automatically improve draft assemblies and find variation among strains"
LABEL website="https://github.com/broadinstitute/pilon"
LABEL license="https://github.com/broadinstitute/pilon/blob/master/LICENSE"
LABEL maintainer="Jake Garfin"
LABEL maintainer.email="jake.garfin@state.mn.us"

RUN apt-get update && apt-get install -y wget \
  openjdk-9-jre

# install pilon
RUN mkdir pilon && \
  cd pilon && \
  wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar && \
  chmod +x pilon-1.23.jar && \
  echo "#!/bin/bash" >> pilon && \
  echo "exec java -jar /pilon/pilon-1.23.jar """"$""@"""" " >> pilon && \
  chmod +x pilon && \
  mkdir /data

WORKDIR /data


ENV PATH="${PATH}:/pilon"

# set perl locale settings
ENV LC_ALL=C

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY pilon/1.23.0/tests /tests
RUN mkdir -p /test_data/asm
COPY test_data/assembly/asm/contigs.fasta /test_data/asm/SRR5481494_sub.uncorrected.fna
COPY test_data/assembly/asm/SRR5481494_sub.paired.bam* /test_data/asm

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests