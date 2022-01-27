ARG BLASTPLUS_VER=2.9.0

FROM ubuntu:xenial as builder
ARG BLASTPLUS_VER

LABEL base.image="ubuntu:xenial"
LABEL software="BLAST+"
LABEL software.version=${BLASTPLUS_VER}
LABEL description="BLAST+: A suite of command-line tools to run BLAST (Basic Local Alignment Search Tool)."
LABEL website="https://www.ncbi.nlm.nih.gov/books/NBK279690/"
LABEL license.url="https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/blast/LICENSE"

RUN apt-get update && apt-get install -y \
    build-essential \
    wget

RUN wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$BLASTPLUS_VER/ncbi-blast-$BLASTPLUS_VER+-src.tar.gz
RUN tar xvf ncbi-blast-$BLASTPLUS_VER+-src.tar.gz && rm ncbi-blast-$BLASTPLUS_VER+-src.tar.gz
WORKDIR ncbi-blast-$BLASTPLUS_VER+-src/c++
RUN ./configure
WORKDIR ./ReleaseMT/build
RUN make all_r

FROM ubuntu:xenial as app
ARG BLASTPLUS_VER

COPY --from=builder ncbi-blast-$BLASTPLUS_VER+-src/c++/ReleaseMT/bin /usr/local/bin
COPY --from=builder ncbi-blast-$BLASTPLUS_VER+-src/c++/ReleaseMT/lib /usr/local/lib
COPY --from=builder /usr/lib/x86_64-linux-gnu/ /usr/lib/x86_64-linux-gnu/

RUN mkdir /data/
WORKDIR /data

FROM app as test

RUN apt-get update && apt-get install -y python3

RUN mkdir ../tests/
COPY tests/ ../tests/
RUN python3 -m unittest discover -v -s ../tests

# Build to test with: docker build --progress=plain --target=test -t ncbi-blast-test .
# Build with: docker build --progress=plain -t ncbi-blast .
# Note: building ncbi-blast-plus from source took approx. 1 hour on a laptop
# Run with: docker run --rm -it ncbi-blast blastx -version
