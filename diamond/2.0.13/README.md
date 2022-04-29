# DIAMOND

This image implements [DIAMOND](https://github.com/bbuchfink/diamond), a sequence aligner for protein and translated DNA searches. Documentation is available at https://github.com/bbuchfink/diamond/wiki.

Because it is installed from source, it doesn't have support for BLAST databases.

## Example usage
This example useage is adapted from the built-in tests for this image.\
*Note: the example uses a toy reference protein file, in reality you'd want to use something more sensible like a BLAST protein database.

```bash
# Get input data (query and reference protein sequences)
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/7639b3c2f9f8f5ef153598e09bb98b7aabcaea2c/general/fasta/msa/BBA0001.tfa -O query_proteins.fasta
wget -nv https://raw.githubusercontent.com/nf-core/test-datasets/modules/data/proteomics/database/yeast_UPS.fasta -O reference_proteins.fasta

# Create diamond-formatted database file from reference proteins
diamond \
  makedb \
  --in reference_proteins.fasta \
  --db reference

# Run tool to find closest hits to query sequence in reference
diamond \
  blastp \
  --db reference \
  --query query_proteins.fasta \
  --out diamond.tsv
```

## Example output

The output file lists the closest hits:\
*Note: see [here](https://github.com/bbuchfink/diamond/wiki/1.-Tutorial) for an explanation of each field.
```
head diamond.tsv

# seq001  sp|P46995|SET2_YEAST    26.7    232     127     11      391     619     64      255     1.57e-10        62.0
# seq006  sp|P46995|SET2_YEAST    24.8    230     134     7       445     670     66      260     4.03e-10        60.8
# seq007  sp|P46995|SET2_YEAST    27.5    251     130     11      422     669     59      260     2.60e-14        74.3
# seq013  sp|P46995|SET2_YEAST    35.0    80      47      2       234     312     185     260     2.25e-07        50.1
```
