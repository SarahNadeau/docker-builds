FROM ubuntu:xenial as app

ARG PARSNP_VER=1.5.6

# Update package index, install packages
RUN apt-get update && apt-get install -y wget

# Install miniconda
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
ENV PATH="/root/miniconda3/bin:${PATH}"

# Install bioconda
RUN conda config --add channels defaults \
    && conda config --add channels bioconda \
    && conda config --add channels conda-forge

# Install parsnp in conda environment
RUN conda create -n parsnp python=3.7 parsnp=$PARSNP_VER
ENV PATH="/root/miniconda3/envs/parsnp/bin:${PATH}"

WORKDIR data/

FROM app as test

# For calculating Robinson-Foulds distance between trees
RUN pip install "robinson-foulds==1.1" six

# Run the tests on app output
RUN mkdir /tests/
COPY tests/ /tests/
RUN python3 -m unittest discover -v -s /tests
