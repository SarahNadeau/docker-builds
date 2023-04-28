# FROM defines the base docker image. This command has to come first in the file
# The 'as' keyword lets you name the folowing stage. We use `app` for the production image
FROM openjdk:11 as app

# ARG sets environment variables during the build stage
ARG BEAST_VER="1.10.4"

# LABEL instructions tag the image with metadata that might be important to the user
# Optional, but highly recommended
LABEL base.image="openjdk:11"
LABEL dockerfile.version="1"
LABEL software="BEAST"
LABEL software.version=$BEAST_VER
LABEL description="BEAST is a software package for phylogenetic analysis with an emphasis on time-scaled trees."
LABEL website="https://beast.community/index.html"
LABEL license="https://github.com/beast-dev/beast-mcmc/blob/master/LICENSE"
LABEL maintainer="Sarah Nadeau"

# RUN executes code during the build
# Install dependencies via apt-get
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    autoconf \
    automake \
    build-essential \
    cmake \
    git \
    libtool \
    pkg-config \
    wget

# Install BEAGLE
RUN git clone --depth=1 https://github.com/beagle-dev/beagle-lib.git && \
    cd beagle-lib && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install

ENV LD_LIBRARY_PATH=/lib:$LD_LIBRARY_PATH

# Install BEAST
RUN wget https://github.com/beast-dev/beast-mcmc/releases/download/v${BEAST_VER}/BEASTv${BEAST_VER}.tgz && \
    tar -zxvf BEASTv${BEAST_VER}.tgz && \
    rm BEASTv${BEAST_VER}.tgz

ENV PATH=$PATH:/BEASTv${BEAST_VER}/bin/

# Help BEAST find BEAGLE library
RUN ldconfig

WORKDIR /data

FROM app as test

# Test BEAGLE
RUN cd /beagle-lib/build && \
    make test

# Test BEAST can find BEAGLE (no actual assertion here)
RUN beast -beagle_info