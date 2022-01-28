FROM ubuntu:bionic as app

LABEL base.image="ubuntu:bionic"
LABEL dockerfile.version="1"
LABEL software="bedtools"
LABEL software.version="2.29.2"
LABEL description="bedtools - the swiss army knife for genome arithmetic"
LABEL website="https://github.com/arq5x/bedtools2"
LABEL license="https://github.com/arq5x/bedtools2/blob/master/LICENSE"
LABEL maintainer="Curtis Kapsak"
LABEL maintainer.email="pjx8@cdc.gov"

RUN apt-get update && apt-get install -y \
 wget

# for ease in creating new dockerfiles. LC_ALL just in case for singularity
ENV bedtoolsVer=2.29.2 \
    LC_ALL=C

# download bedtools static binary
RUN cd /usr/local/bin && \
 wget https://github.com/arq5x/bedtools2/releases/download/v${bedtoolsVer}/bedtools.static.binary && \
 mv bedtools.static.binary bedtools && \
 chmod +x bedtools && \
 mkdir /data

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY bedtools/2.29.2/tests /tests
RUN mkdir -p /test_data/asm
# Copy alignments
COPY test_data/assembly/asm/SRR5481494_sub.*.bam /test_data/asm/

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests
