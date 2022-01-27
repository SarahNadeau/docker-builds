FROM ubuntu:xenial as builder

ARG BARRNAP_VER=0.8
ARG HMMER_VER=3.3.2
ARG BEDTOOLS_VER=2.30.0

LABEL base.image="ubuntu:xenial"
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

RUN mkdir /data/
WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY barrnap/0.8/tests /tests
RUN mkdir -p /test_data/asm
COPY test_data/asm/SRR5481494_sub.fasta /test_data/asm/

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests
