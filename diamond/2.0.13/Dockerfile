ARG DIAMOND_VER="2.0.13"

FROM ubuntu:xenial as builder
ARG DIAMOND_VER

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="2"
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

COPY --from=builder /usr/local/bin/diamond /usr/local/bin/diamond

# Re-install wget to copy test data
RUN apt-get update && apt-get install -y wget

WORKDIR /data

FROM app as test
ARG DIAMOND_VER

# Run test script
COPY test.sh .
RUN bash test.sh $DIAMOND_VER
