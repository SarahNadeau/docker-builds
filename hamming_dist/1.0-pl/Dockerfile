FROM ubuntu:xenial as app

RUN apt-get upgrade && apt-get update && apt-get install -y \
    bioperl

WORKDIR /usr/local/bin
COPY pairwiseDistances.pl .

# Make executable to all necessary for running with nextflow
RUN chmod a+x pairwiseDistances.pl

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY tests/ /tests/

# Run tests
RUN python3 -m unittest discover -s /tests