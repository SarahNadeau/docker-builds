FROM snads/biopython:1.79 as app

# Necessary for running with nextflow
RUN apt-get update && apt-get -y install procps

WORKDIR /usr/local/bin
COPY xmfa_to_fasta/2.0/convert_xmfa_to_fasta.py .

# Make executable to all necessary for running with nextflow
RUN chmod a+x *.py

WORKDIR /data

FROM app as test

# Get test dependencies
COPY xmfa_to_fasta/2.0/tests /tests

# Run tests
RUN python3 -m unittest discover -s /tests
