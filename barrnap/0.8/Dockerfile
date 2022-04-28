
ARG BARRNAP_VER=0.8

FROM ubuntu:xenial as builder
ARG BARRNAP_VER
ARG HMMER_VER=3.3.2
ARG BEDTOOLS_VER=2.30.0

LABEL base.image="ubuntu:xenial"
LABEL dockerfile.version="2"
LABEL software="Barrnap"
LABEL software.version=${BARRNAP_VER}
LABEL description="Barrnap: BAsic Rapid Ribosomal RNA Predictor."
LABEL website="https://vicbioinformatics.com/software.barrnap.shtml"
LABEL license.url="https://github.com/tseemann/barrnap/blob/master/LICENSE"

RUN apt-get update && apt-get install -y \
    build-essential \
    libbz2-dev \
    liblzma-dev \
    make \
    python \
    wget \
    zlib1g-dev

# Install requirements
RUN cpan Time::Piece

RUN wget http://eddylab.org/software/hmmer/hmmer-$HMMER_VER.tar.gz
RUN tar xvf hmmer-$HMMER_VER.tar.gz && rm hmmer-$HMMER_VER.tar.gz
WORKDIR hmmer-$HMMER_VER
RUN ./configure --prefix /usr/local && make && make install

WORKDIR /
RUN wget https://github.com/arq5x/bedtools2/archive/refs/tags/v$BEDTOOLS_VER.tar.gz
RUN tar xvf v$BEDTOOLS_VER.tar.gz && rm v$BEDTOOLS_VER.tar.gz
WORKDIR bedtools2-$BEDTOOLS_VER/
RUN make && cp -r ./bin/* /usr/local/bin/

# Install barrnap
WORKDIR /
RUN wget https://github.com/tseemann/barrnap/archive/refs/tags/$BARRNAP_VER.tar.gz
RUN tar -xvf $BARRNAP_VER.tar.gz && rm $BARRNAP_VER.tar.gz
RUN mv /barrnap-$BARRNAP_VER/bin/barrnap /usr/local/bin/
RUN mv /barrnap-$BARRNAP_VER/db /usr/local/db

FROM ubuntu:xenial as app

# Copy executables and barrnap database
COPY --from=builder /usr/ /usr/

# Re-install wget for pulling in test data
RUN apt-get update && apt-get install -y wget

RUN mkdir /data/
WORKDIR /data

FROM app as test
ARG BARRNAP_VER

# Run test script
COPY test.sh .
RUN bash test.sh $BARRNAP_VER
