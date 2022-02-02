# Use xenial because bioperl install on ubuntu 20.04 doesn't work for Perl script
FROM ubuntu:focal
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bioperl \
    python3-pip

RUN apt-get update && apt-get install -y cpanminus
RUN cpanm Bio::Perl

WORKDIR app/
COPY 1.0-py/requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

ENTRYPOINT [ "bash", "speedcheck_python_vs_perl/speedcheck.sh" ]

# Build with: docker build -t speedcheck -f speedcheck_python_vs_perl/Dockerfile .
# Run note: container expects hamming_dist to be a bound working directory, uses the most working versions of perl & python implementations, speedcheck.sh from there
# Run with: docker run --rm --mount type=bind,source="$(pwd)",target=/app speedcheck