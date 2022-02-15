#!/usr/bin/env python3

import argparse
from functools import partial
import gzip
import re
import sys


def parseArgs():
    parser = argparse.ArgumentParser(
        description="Convert ParSNP XMFA to FastA alignment format."
    )
    parser.add_argument(
        "--xmfa",
        help="ParSNP XMFA-formatted core genome alignment. Optionally gzipped with suffix '.gz'.",
        required=True
    )
    parser.add_argument(
        "--verbose",
        help="Log intermediate results.",
        action='store_true',
        default=False
    )
    return parser.parse_args()


def main():
    opt = parseArgs()

    logmsg("Reading in XMFA alignment.")
    header_replacements = get_headers(opt.xmfa)
    if opt.verbose:
        logmsg("Header replacements:")
        logmsg(header_replacements)
    sequences = get_xmfa_sequences(opt.xmfa, header_replacements)
    validate_xmfa(sequences)

    logmsg("Writing out FastA alignment.")
    write_fasta(sequences)


def logmsg(*opt, **kwopt):
    print(*opt, file=sys.stderr, **kwopt)


# Replace numeric index headers with ##SequenceName entries
def get_headers(xmfa_file):
    _open = partial(gzip.open, mode='rt') if xmfa_file.endswith('.gz') else open
    header_replacements = {}
    with _open(xmfa_file) as f:
        while True:
            line = f.readline()
            if re.match("^##SequenceIndex", line):
                index = line.strip().split()[1]
            elif re.match("^##SequenceFile", line):
                header = line.strip().split()[1]
                header_replacements[">" + index] = ">" + header
            elif re.match("^>", line):
                return header_replacements


# Parse ParSNP XMFA alignment
# Returns dictionary with sequence header keys. Values are dictionaries, with cluster name keys and sequence values.
def get_xmfa_sequences(xmfa_file, header_replacements):
    sequences = {}
    is_first = True
    _open = partial(gzip.open, mode='rt') if xmfa_file.endswith('.gz') else open
    f = _open(xmfa_file)
    for line in f:
        # Ignore comment lines and cluster (locally co-linear block) separator lines
        if re.match("^#", line) or re.match("^=", line) or line == "\n":
            continue
        # Parse sequence information at header line
        elif re.match("^>", line):
            # Store finished sequence
            if is_first:
                is_first = False
            elif header not in sequences.keys():
                sequences[header] = {cluster: sequence}
            else:
                sequences[header][cluster] = sequence
            # Parse info for upcoming sequence
            parsed_line = line.strip().split()
            cluster = parsed_line[2]
            header = parsed_line[0].split(":")[0]
            if header not in header_replacements.values():  # Do nothing when headers are already filenames
                header = header_replacements[header]
            sequence = ''
        # Aggregate lines of sequence bases
        else:
            sequence = sequence + line.strip()
    f.close()
    # Store last sequence
    if header not in sequences.keys():
        sequences[header] = {cluster: sequence}
    else:
        sequences[header][cluster] = sequence
    return sequences


# Check that all headers have a sequence for each cluster, and that each sequence from a cluster is the same length
def validate_xmfa(sequences):
    first_seq = True
    for header in sequences.keys():
        if first_seq:
            cluster_set = set(sequences[header].keys())
            first_seq = False
        cluster_difference = cluster_set.difference(set(sequences[header].keys()))
        if len(cluster_difference) > 0:
            raise AssertionError(
                "Sequence {} has missing or unexpected cluster(s): {}".format(header, cluster_difference)
            )
    for cluster in cluster_set:
        first_seq = True
        for header in sequences.keys():
            if first_seq:
                reference_len = len(sequences[header][cluster])
                first_seq = False
            sequence_len = len(sequences[header][cluster])
            if sequence_len != reference_len:
                raise AssertionError(
                    "Sequence {} cluster {} is {} characters instead of expected {}.".format(
                        header, cluster, sequence_len, reference_len)
                )


# Writes out a FastA file with recombination positions masked with 'N'
def write_fasta(sequences):
    first_seq = True
    for header in sequences.keys():
        if first_seq:
            cluster_order = list(sequences[header].keys())
            first_seq = False
        sequence = ''
        for cluster in cluster_order:
            sequence = sequence + sequences[header][cluster]
        print(header)
        print(sequence)


if __name__ == "__main__":
    main()
