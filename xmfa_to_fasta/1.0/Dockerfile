FROM snads/bioperl:1.6.924-3 as app

COPY xmfa_to_fasta/1.0/scripts/ /usr/local/bin/

RUN chmod +x /usr/local/bin/*

WORKDIR /data

FROM app as test

# Get test dependencies
RUN apt-get update && apt-get install -y python3
COPY xmfa_to_fasta/1.0/tests /tests
COPY test_data/alignment/aln/parsnp.xmfa.gz /test_data/aln/

# Run positive control
RUN bash /tests/scripts/run_positive_control.sh

# Check output
RUN python3 -m unittest discover -s /tests