FROM ubuntu:focal as app

ARG SWGA_VER="0.4.4"

LABEL base.image="ubuntu:focal"
LABEL dockerfile.version="1"
LABEL software="SWGA"
LABEL software.version=$SWGA_VER
LABEL description="This software designs primers for selective whole-genome amplification of a target genome over a background genome."
LABEL website="https://github.com/eclarke/swga/wiki"
LABEL license="https://github.com/eclarke/swga/blob/master/LICENSE"

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    bc \
    build-essential \
    git \
    python2 \
    wget \
    zlib1g-dev

# Install pip
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python2 get-pip.py

# Set up python virtual environment for swga
RUN wget https://pypi.python.org/packages/source/v/virtualenv/virtualenv-12.0.tar.gz && \
    tar xvfz virtualenv-12.0.tar.gz && \
    cd virtualenv-12.0 && \
    python2 virtualenv.py /swga_env

# Add virtual environment to PATH so that packages are available
ENV PATH="/swga_env/venv/bin:$PATH"

# Install swga
RUN pip install git+https://github.com/eclarke/swga

# A hack soln: put dsk where swga looks for it (see https://github.com/eclarke/swga/blob/b36cefaeb50d595e34068a86f466c3c9fde5aab7/swga/utils.py#L63, which leads to https://github.com/eclarke/swga/issues/49)
RUN cp /usr/local/bin/dsk /usr/bin/dsk && \
    cp /usr/local/bin/set_finder /usr/bin/set_finder

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY tests /tests

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests