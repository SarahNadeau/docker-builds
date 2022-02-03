FROM ubuntu:focal as builder

# Note: download source doesn't have many other versions, download is not generalizable
ARG MUSCLE_VER="3.8.425"

LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
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

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY muscle/3.8.425/tests /tests

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests

