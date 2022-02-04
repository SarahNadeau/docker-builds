FROM ubuntu:focal as app

ARG FIGTREE_VER="1.4.4"

LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
LABEL software="FigTreee"
LABEL software.version=$FIGTREE_VER
LABEL description="FigTree: a graphical viewer and software for producing visualizations of phylogenetic trees."
LABEL website="http://tree.bio.ed.ac.uk/software/figtree/"
LABEL license="GNU Lesser General Public License (according to https://directory.fsf.org/wiki/FigTree#tab=Details)"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget

RUN wget https://github.com/rambaut/figtree/releases/download/v$FIGTREE_VER/FigTree_v$FIGTREE_VER.tgz && \
    tar -xzf FigTree_v$FIGTREE_VER.tgz && \
    rm FigTree_v$FIGTREE_VER.tgz

# Wrapper script for running FigTree assumes you're in the FigTree directory, fix to absolute path
RUN sed "s/lib/\/FigTree_v$FIGTREE_VER\/lib/g" /FigTree_v$FIGTREE_VER/bin/figtree > /usr/local/bin/figtree && \
    chmod g+x /usr/local/bin/figtree

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY figtree/1.4.4/tests /tests

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests

