# FigTree

This image implements [FigTree](http://tree.bio.ed.ac.uk/software/figtree/), a software for producing visualizations of phylogenetic trees.

## Example usage
This example useage is adapted from the built-in tests for this image.

```bash
# Get input data (a Newick-formatted phylogenetic tree)
echo "(GCF_000292685:0.0000009427,(GCF_000298385:0.0003914987,(GCF_002849995:0.0025820788,GCF_902713755:0.1808976496)100:0.0016343704)100:0.0002269453,GCF_000300075:0.0000086193);
" > tree.nwk

# Run tool to visualize a phylogeny
figtree \
  -graphic PNG \
  tree.nwk \
  tree.png
```

## Example output

The output of this command is a phylogenetic tree visualization:
![tree](tree.png)
