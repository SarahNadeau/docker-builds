FROM ubuntu:focal as builder

ARG MUSCLE_VER="5.1"

LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
LABEL software="MUSCLE"
LABEL software.version=$MUSCLE_VER
LABEL description="MUSCLE: MUltiple Sequence Comparison by Log- Expectation. A software for making multiple alignments of biological sequences."
LABEL website="https://drive5.com/muscle"
LABEL license="https://github.com/rcedgar/muscle/blob/main/LICENSE"

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget

RUN wget https://github.com/rcedgar/muscle/archive/refs/tags/v$MUSCLE_VER.tar.gz && \
 tar -xzf v$MUSCLE_VER.tar.gz && \
 rm v$MUSCLE_VER.tar.gz

WORKDIR muscle-$MUSCLE_VER/src
RUN make
RUN cp /muscle-$MUSCLE_VER/src/Linux/muscle /usr/local/bin/muscle

FROM ubuntu:focal as app

COPY --from=builder /usr/local /usr/local
COPY --from=builder /usr/bin/wget /usr/bin/wget

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY muscle/5.1/tests /tests

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests

