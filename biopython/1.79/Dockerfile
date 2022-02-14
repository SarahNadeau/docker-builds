FROM ubuntu:focal as app

RUN apt-get update && apt-get install -y python3-pip

RUN pip3 install biopython

FROM app as test

COPY tests/ /tests/

# Test version
RUN python3 -m unittest discover -s /tests