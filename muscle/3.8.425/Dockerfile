# Note: download source doesn't have many other versions, download is not generalizable
ARG MUSCLE_VER="3.8.425"

FROM ubuntu:focal as builder
ARG MUSCLE_VER

LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="2"
LABEL software="MUSCLE"
LABEL software.version=$MUSCLE_VER
LABEL description="MUSCLE: MUltiple Sequence Comparison by Log- Expectation. A software for making multiple alignments of biological sequences."
LABEL website="https://drive5.com/muscle"
LABEL license="https://github.com/rcedgar/muscle/blob/main/LICENSE"

RUN apt-get update && apt-get install -y wget

RUN wget https://drive5.com/muscle/muscle${MUSCLE_VER}_binaries.tar.gz && \
 tar -xzf muscle${MUSCLE_VER}_binaries.tar.gz && \
 rm muscle${MUSCLE_VER}_binaries.tar.gz

RUN cp muscle${MUSCLE_VER}_i86linux32 /usr/local/bin/muscle

FROM ubuntu:focal as app

COPY --from=builder /usr/local /usr/local

# Re-install wget to copy test data
RUN apt-get update && apt-get install -y wget

WORKDIR /data

FROM app as test
ARG MUSCLE_VER

# Run test script
COPY test.sh .
RUN bash test.sh $MUSCLE_VER
