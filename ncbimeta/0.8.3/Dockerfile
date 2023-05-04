FROM ubuntu:focal as app

RUN apt-get update && apt-get install -y \
    git \
    python3-pip

RUN git clone https://github.com/ktmeaton/NCBImeta.git && \
    cd NCBImeta && \
    pip install .

WORKDIR /data

FROM app as test

RUN NCBImeta --version