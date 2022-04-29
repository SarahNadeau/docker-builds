# Gubbins

This image implements [Gubbins](https://github.com/nickjcroucher/gubbins), a tool for inference of recombination and phylogeny building excluding these positions.
Documentation is available at https://github.com/nickjcroucher/gubbins. 

In addition to Gubbins, the image also contains these dependencies:
* Python 3.8.0
* RAxML 8.2.12
* IQ-TREE 1.6.6
* FastTree 2.1.11

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get input data (a phylogenetic tree and corresponding sequence alignment)
wget -nv https://raw.githubusercontent.com/rpetit3/test-datasets/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.nwk
wget -nv https://github.com/rpetit3/test-datasets/raw/36210e255ffcac070a6d75be8c30e4d4bdd8c037/data/genomics/prokaryotes/candidatus_portiera_aleyrodidarum/genome/genome.aln.gz
gunzip genome.aln.gz

# Run tool to infer recombination from alignment
run_gubbins.py \
  --starting-tree genome.aln.nwk \
  --prefix test \
    genome.aln

# Run tool to mask recombination positions in alignment
mask_gubbins_aln.py \
  --aln genome.aln \
  --gff test.recombination_predictions.gff \
  --out genome_masked.aln
```

## Example output

The on-screen output is long and tedious, but at the end it tells you how long this test took:

```
...
Final tree written to:                 /data/tmpir_z8_if/RAxML_result.genome.iteration_4_reconstruction
Execution Log File written to:         /data/tmpir_z8_if/RAxML_log.genome.iteration_4_reconstruction

Running joint ancestral reconstruction with pyjar

Transferring pyjar results onto original recombination-corrected tree

Done transfer
...done. Run time: 2.81 s

Running Gubbins to detect recombinations...
gubbins -r -v genome.aln.gaps.vcf -a 100 -b 10000 -f /data/tmpir_z8_if/genome.aln -t genome.iteration_4.tre -m 3 /data/tmpir_z8_if/genome.iteration_4.internal.joint.aln
...done. Run time: 3.12 s

Checking for convergence...
Convergence after 4 iterations: Tree observed before.

Exiting the main loop.

Creating the final output...
...finished. Total run time: 3.15 s
```

The results files from these commands are many, the most important being:

```     
test.recombination_predictions.gff  # inferred recombination sites       
genome_masked.aln  # alignment with recombination positions masked
test.node_labelled.final_tree.tre  # recombination-corrected tree with internal nodes labelled

cat test.recombination_predictions.gff 

# ##gff-version 3
# ##sequence-region SEQUENCE 1 232041
# SEQUENCE        GUBBINS CDS     214246  214283  0.000   .       0       node="Node_1->GCF_002849995";neg_log_likelihood="2492.230657";taxa="GCF_002849995";snp_count="23";
# SEQUENCE        GUBBINS CDS     4158    4860    0.000   .       0       node="Node_1->GCF_002849995";neg_log_likelihood="2466.822922";taxa="GCF_002849995";snp_count="24";
# SEQUENCE        GUBBINS CDS     135132  136539  0.000   .       0       node="Node_1->GCF_002849995";neg_log_likelihood="2412.915913";taxa="GCF_002849995";snp_count="25";
# SEQUENCE        GUBBINS CDS     16063   18039   0.000   .       0       node="Node_1->GCF_002849995";neg_log_likelihood="2350.521590";taxa="GCF_002849995";snp_count="30";
# SEQUENCE        GUBBINS CDS     201622  201893  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38839.327781";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="173";
# SEQUENCE        GUBBINS CDS     189167  189260  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38749.408558";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="48";
# SEQUENCE        GUBBINS CDS     74713   74772   0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38709.673259";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="29";
# SEQUENCE        GUBBINS CDS     125474  125566  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38683.271760";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="40";
# SEQUENCE        GUBBINS CDS     192881  193019  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38645.444157";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="52";
# SEQUENCE        GUBBINS CDS     212196  212250  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38595.288118";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="29";
# SEQUENCE        GUBBINS CDS     24379   24462   0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38569.838178";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="35";
# SEQUENCE        GUBBINS CDS     221304  221377  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38537.819340";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="30";
# SEQUENCE        GUBBINS CDS     231873  231944  0.000   .       0       node="Node_4->Node_3";neg_log_likelihood="38509.816799";taxa=" GCF_000300075  GCF_000292685  GCF_002849995 GCF_000298385";snp_count="28";
```