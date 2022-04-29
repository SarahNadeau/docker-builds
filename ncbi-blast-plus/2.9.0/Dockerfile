ARG BLASTPLUS_VER=2.9.0

FROM ubuntu:xenial as app
ARG BLASTPLUS_VER

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="2"
LABEL software="BLAST+"
LABEL software.version=${BLASTPLUS_VER}
LABEL description="BLAST+: A suite of command-line tools to run BLAST (Basic Local Alignment Search Tool)."
LABEL website="https://www.ncbi.nlm.nih.gov/books/NBK279690/"
LABEL license.url="https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/blast/LICENSE"

# Install blast+ dependencies (for running e.g. update_blastdb.pl)
RUN apt-get update && apt-get install -y \
    curl \
    libjson-perl \
    perl \
    wget

# Install blast+
RUN wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$BLASTPLUS_VER/ncbi-blast-$BLASTPLUS_VER+-x64-linux.tar.gz \
    && tar xvf ncbi-blast-$BLASTPLUS_VER+-x64-linux.tar.gz \
    && rm ncbi-blast-$BLASTPLUS_VER+-x64-linux.tar.gz \
    && mv ncbi-blast-$BLASTPLUS_VER+/bin/* /usr/local/bin/

RUN mkdir /data/
WORKDIR /data

FROM app as test
ARG BLASTPLUS_VER

# Run test script
COPY test.sh .
RUN bash test.sh $BLASTPLUS_VER
