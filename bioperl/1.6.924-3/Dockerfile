FROM ubuntu:xenial as app
# Note: the bioperl install hangs forever when using ubuntu, possibly similar to https://github.com/docker/for-linux/issues/738?

RUN apt-get update && apt-get install -y \
    bioperl

FROM app as test

RUN apt-get update && apt-get install -y python3
COPY tests/ /tests/

# Run some tiny perl scripts using BioPerl (doesn't actually test output)
RUN bash /tests/scripts/run_test_scripts.sh

# Test BioPerl version
RUN python3 -m unittest discover -s /tests