## Down-sample fasta

This tool down-samples a (single or multi-) FastA file without replacement.

### Arguments
* chunk_size: Length of sequence in each chunk.
* n_chunks: Number of chunks to sample.
* no_concatenate: If supplied, # out entries = n_chunks, rather than default # out entries = # in entries.

### Output
n_chunks * chunk_size is roughly the sequence length you will get back (roughly because you may sample a short chunk at the end of a sequence).
If the combined length of your sequence(s) is shorter than n_chunks * chunk_size, you will get back the full sequence(s).