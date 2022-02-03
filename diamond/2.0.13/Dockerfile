FROM ubuntu:xenial as builder

ARG DIAMOND_VER="2.0.13"

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="1"
LABEL software="DIAMOND"
LABEL software.version=$DIAMOND_VER
LABEL description="DIAMOND: accelerated BLAST compatible local sequence aligner."
LABEL website="https://github.com/bbuchfink/diamond"
LABEL license="https://github.com/bbuchfink/diamond/blob/master/LICENSE"

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libpthread-stubs0-dev \
    wget \
    zlib1g-dev

RUN wget http://github.com/bbuchfink/diamond/archive/v$DIAMOND_VER.tar.gz && \
 tar -xzf v$DIAMOND_VER.tar.gz && \
 rm v$DIAMOND_VER.tar.gz && \
 mkdir /data

WORKDIR diamond-$DIAMOND_VER/bin
RUN cmake .. && make -j4 && make install

FROM ubuntu:focal as app

COPY --from=builder /usr/local /usr/local

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY diamond/2.0.13/tests /tests

# Copy test data
COPY test_data/assembly/annot/SRR5481494_sub.faa /test_data/annot/
COPY test_data/assembly/GCF_001997265.1_ASM199726v1_protein.faa /test_data/
COPY test_data/assembly/GCF_001997265.1.faa /test_data/

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests

