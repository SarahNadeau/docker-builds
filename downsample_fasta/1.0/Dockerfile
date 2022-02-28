FROM ubuntu:focal as app

RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install Bio

# Necessary for running with nextflow
RUN apt-get update && apt-get -y install procps

WORKDIR /usr/local/bin
COPY downsample_fasta.py .

# Make executable to all necessary for running with nextflow
RUN chmod a+x *.py

WORKDIR /data

FROM app as test

# Get test dependencies
COPY tests/ /tests/

# Run tests
RUN python3 -m unittest discover -s /tests
