# ClonalFrameML

This image implements [ClonalFrameML](https://github.com/xavierdidelot/ClonalFrameML), a tool for Maximum-likelihood inference of recombination in bacterial genomes.
Documentation is available at https://github.com/xavierdidelot/clonalframeml/wiki. 

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get input data (a phylogenetic tree and corresponding sequence alignment)
wget -nv https://raw.githubusercontent.com/rpetit3/test-datasets/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.nwk
wget -nv https://github.com/rpetit3/test-datasets/raw/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.gz
gunzip genome.aln.gz

# Run tool to infer recombination from alignment
ClonalFrameML \
  genome.aln.nwk \
  genome.aln \
  test \
  -output_filtered true

# Run tool to generate PDF output
Rscript /ClonalFrameML/src/cfml_results.R test
```

## Example output

The on-screen output tells you what the tool did:

```
ClonalFrameML v1.12
output_filtered = true
Finished reading in control file.

Read 5 sequences of length 232041 sites from genome.aln
IMPUTATION AND RECONSTRUCTION OF ANCESTRAL STATES:
Analysing 31037 sites
Empirical nucleotide frequencies:   A 41%   C 10.6%   G 15.7%   T 32.8%
Maximum log-likelihood for imputation and ancestral state reconstruction = -135777
Wrote imputed and reconstructed ancestral states to test.ML_sequence.fasta
Wrote position cross-reference file to test.position_cross_reference.txt
BRANCH LENGTH CORRECTION/RECOMBINATION ANALYSIS:
Analysing 232041 sites
Empirical nucleotide frequencies:   A 41%   C 10.6%   G 15.7%   T 32.8%
Beginning branch optimization. Key to parameters (and constraints):
B   uncorrected branch length
L   maximum unnormalized log-posterior per branch
P   contribution of the prior to L
R   R/theta per branch                                       (> 0)
I   mean DNA import length per branch                        (> 0)
D   divergence of DNA imported by recombination              (> 0)
M   expected number of mutations per branch                  (> 0)
 L = -126005 P = -1299.73 R = 0.00611223 I = 108.038 D = 0.0300432 in 71.8891 s and 57 evaluations
 Posterior alphas: R = 179.391 I = 179.399 D = 552.55
 ClonalFrameML log-likelihood ratio of 1128.04 indicates evidence for recombination
Branch GCF_000298385 B = 0.00038355 M = 0.000335261
Branch GCF_000300075 B = 1.29286e-05 M = 1.23856e-05
Branch GCF_002849995 B = 0.00229268 M = 0.00172045
Branch GCF_902713755 B = 0.130135 M = 0.131889
Branch NODE_6 B = 0.00160746 M = 0.00152066
Branch NODE_7 B = 0.000232715 M = 0.000210403
Wrote inferred importation status to test.importation_status.txt
Wrote filtered alignment to test.filtered.fasta
Wrote processed tree to test.labelled_tree.newick
All done in 1.20594 minutes.
```

The results files from these commands are many, the most important being:

```      
test.importation_status.txt  # tab-delimited file of inferred recombination sites
test.cfml.pdf  # PDF summary of tool output         
test.filtered.fasta  # alignment with recombination positions filtered out
test.labelled_tree.newick  # recombination-corrected tree with internal nodes labelled

cat test.importation_status.txt

# Node    Beg     End
# GCF_002849995   4452    4476
# GCF_002849995   17287   17786
# GCF_002849995   48542   48615
# GCF_002849995   90134   90143
# GCF_002849995   117241  117248
# GCF_002849995   136041  136205
# GCF_002849995   214246  214283
# GCF_902713755   28978   29172
# GCF_902713755   38937   39108
# GCF_902713755   39250   39569
# GCF_902713755   58591   59716
# GCF_902713755   59942   61068
# GCF_902713755   88083   89523
# GCF_902713755   92089   92317
# GCF_902713755   119992  120782
# GCF_902713755   139042  139221
# GCF_902713755   164939  165122
# GCF_902713755   175277  175500
# GCF_902713755   210076  210301
# GCF_902713755   212515  212666
# GCF_902713755   224542  225023
```