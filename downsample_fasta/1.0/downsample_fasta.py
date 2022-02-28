#!/usr/bin/env python3

import argparse
from Bio import SeqIO
from functools import partial
import gzip
import sys
import random


def parseArgs():
    parser = argparse.ArgumentParser(
        description="Down-sample a (single or multi-) FastA file without replacement."
    )
    parser.add_argument(
        "--fasta",
        help="FastA file (single or multi-entry). Optionally gzipped with suffix '.gz'.",
        required=True
    )
    parser.add_argument(
        "--chunk_size",
        help="Length of sequence in each chunk.",
        type=int,
        required=True
    )
    parser.add_argument(
        "--n_chunks",
        type=int,
        help="Number of chunks to sample.",
        required=True
    )
    parser.add_argument(
        "--no_concatenate",
        help="If supplied, # out entries = n_chunks, rather than default # out entries = # in entries.",
        action = 'store_true'
    )
    parser.add_argument(
        "--seed",
        help="Integer random seed (for reproducible results).",
        type=int,
        default=None
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

    if opt.seed:
        random.seed(opt.seed)

    logmsg("Reading in and chunking FastA file.")
    ids, chunks = load_and_chunk_fasta(opt.fasta, opt.chunk_size)
    if opt.verbose:
        logmsg("Chunked input:")
        logmsg(ids)
        logmsg(chunks)

    logmsg("Sampling chunks.")
    downsample_fasta(ids, chunks, opt.n_chunks, opt.no_concatenate)


def logmsg(*opt, **kwopt):
    print(*opt, file=sys.stderr, **kwopt)


# Loads a FastA file, parsing it into chunks
def load_and_chunk_fasta(fasta_file, chunk_size):
    _open = partial(gzip.open, mode='rt') if fasta_file.endswith('.gz') else open
    ids = []
    chunks = []
    with _open(fasta_file) as f:
        for rec in SeqIO.parse(f, "fasta"):
            seq_str = str(rec.seq)
            if len(seq_str) < chunk_size:
                logmsg("Chunk size is greater than sequence {} length, chunk is whole sequence".format(rec.id))
            rec_chunks = [seq_str[i:i+chunk_size] for i in range(0, len(seq_str), chunk_size)]
            ids = ids + [rec.id] * len(rec_chunks)
            chunks = chunks + rec_chunks
    return (ids, chunks)


# Selects random chunks from FastA file, writes them out to stdout
def downsample_fasta(ids, chunks, n_chunks, no_concatenate):
    if n_chunks > len(chunks):
        logmsg("Fewer than specified number chunks in file, returning whole sequence(s).")
        n_chunks = len(chunks)

    sampled_idxs = random.sample(range(len(ids)), k=n_chunks)
    sampled_idxs.sort()  # need to keep chunks in order so they get written out under the proper header

    prev_id = None
    for idx in sampled_idxs:
        # Write out header
        id = ids[idx]
        if id != prev_id:
            if no_concatenate:
                id = id + "_chunk_" + str(idx)
                print(">" + id)
            else:
                print(">" + id)
            prev_id = id
        # Write out chunk
        print(chunks[idx])


if __name__ == "__main__":
    main()
