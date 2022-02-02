## Hamming distance

This code implements hamming distance calculation betweeen pairs of sequences in an alignment.

An older implementation is the Perl script [pairwiseDistances.pl](1.0-pl/pairwiseDistances.pl) and a newer implementation is the Python script [pairwiseDistances.py](1.0-py/pairwiseDistances.py).

### Requirements
The Python version requires Biopython (see [requirements.txt](1.0-py/requirements.txt)), and Biopython requires Python 3.6 or later.

### Inputs
Both scripts take the same inputs, except that the Python version cannot read from stdin.

### Outputs
Both scripts produce the same output, by default to stdout. Log messages are identical except for frequency of queue logging.

### Containerization
The directories for each script contain a Dockerfile that will create a container with the scripts and their requirements:
* [Perl implementation Dockerfile](1.0-pl/Dockerfile)
* [Python implementation Dockerfile](1.0-py/Dockerfile)

### Speed
A preliminary speedcheck shows the Python implementation is faster, at least for very small simulated genomes:
![alt text](speedcheck_python_vs_perl/speedcheck.png)