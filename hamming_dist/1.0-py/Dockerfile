FROM python:3.8-slim-buster as app

# Necessary for running with nextflow
RUN apt-get update && apt-get -y install procps

WORKDIR /
COPY requirements.txt .
RUN pip3 install -r requirements.txt

WORKDIR /usr/local/bin
COPY pairwiseDistances.py .
COPY pairwiseTo2d.py .

# Make executable to all necessary for running with nextflow
RUN chmod a+x *.py

WORKDIR /data

FROM app as test

# Get test dependencies
COPY tests/ /tests/

# Run tests
RUN python3 -m unittest discover -s /tests