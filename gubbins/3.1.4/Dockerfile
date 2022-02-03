# Thanks to: https://github.com/puethe/gubbins/blob/master/Dockerfile
ARG GUBBINS_VER="3.1.4"

FROM ubuntu:focal as app
ARG GUBBINS_VER
ARG PYTHON_VER="3.8.0"
ARG NUMPY_VER="1.19.5"
ARG BIOPYTHON_VER="1.79"
ARG DENDROPY_VER="4.5.2"
ARG RAXML_VER="8.2.12"
ARG IQTREE_VER="1.6.6"
ARG FASTTREE_VER="2.1.11"

LABEL base.image="ubuntu:xenial"
LABEL software="Gubbins"
LABEL software.version=${GUBBINS_VER}
LABEL description="Gubbins: inference of recombination and phylogeny building excluding these positions."
LABEL website="https://github.com/nickjcroucher/gubbins"
LABEL license.url="https://github.com/nickjcroucher/gubbins/blob/master/LICENSE"

# Update package index, install packages
ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH="/usr/local/lib"

RUN apt-get update && apt-get install -y \
    autoconf \
    automake-1.15 \
    build-essential \
    check \
    cmake \
    gcc \
    libblas-dev \
    libeigen3-dev \
    libffi-dev \
    liblapack-dev \
    libsqlite3-dev \
    libssl-dev \
    libsubunit-dev \
    libtool \
    make \
    python3-pip \
    wget \
    zlib1g-dev

# Install python package dependencies
RUN pip3 install biopython==$BIOPYTHON_VER && \
    pip3 install dendropy==$DENDROPY_VER && \
    pip3 install nose && \
    pip3 install numba && \
    pip3 install numpy==$NUMPY_VER && \
    pip3 install scipy

# Install RAxML: https://cme.h-its.org/exelixis/resource/download/NewManual.pdf
WORKDIR /
RUN wget https://github.com/stamatak/standard-RAxML/archive/refs/tags/v$RAXML_VER.tar.gz && \
    tar xvf v$RAXML_VER.tar.gz && \
    rm v$RAXML_VER.tar.gz
WORKDIR standard-RAxML-$RAXML_VER
RUN make -f Makefile.AVX.PTHREADS.gcc && \
    cp /standard-RAxML-$RAXML_VER/raxmlHPC-PTHREADS-AVX /usr/local/bin/raxmlHPC-PTHREADS

# Install IQ-TREE
WORKDIR /
RUN wget https://github.com/Cibiv/IQ-TREE/archive/refs/tags/v$IQTREE_VER.tar.gz && \
    tar xvf v$IQTREE_VER.tar.gz && \
    rm v$IQTREE_VER.tar.gz
WORKDIR IQ-TREE-$IQTREE_VER
WORKDIR build
RUN  cmake .. && \
     make && \
     cp /IQ-TREE-1.6.6/build/iqtree /usr/local/bin/iqtree

# Install FastTree: http://www.microbesonline.org/fasttree/#Install
WORKDIR /
RUN wget http://www.microbesonline.org/fasttree/FastTree.c && \
    gcc -O3 -finline-functions -funroll-loops -Wall -o /usr/local/bin/FastTree FastTree.c -lm

# Install Gubbins
WORKDIR /
RUN wget https://github.com/nickjcroucher/gubbins/archive/refs/tags/v$GUBBINS_VER.tar.gz && \
    tar xvf v$GUBBINS_VER.tar.gz && \
    rm v$GUBBINS_VER.tar.gz
WORKDIR gubbins-$GUBBINS_VER
RUN autoreconf -i && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    cd python && \
    python3 setup.py install

WORKDIR /data

FROM app as test

ENV LD_LIBRARY_PATH="/usr/lib:/usr/local/lib"

# Get test dependencies
COPY gubbins/3.1.4/tests /tests

# Copy test data
COPY test_data/alignment/aln/parsnp.tree /test_data/
COPY test_data/alignment/aln/parsnp.fasta.gz /test_data/
RUN gunzip /test_data/parsnp.fasta.gz

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests
