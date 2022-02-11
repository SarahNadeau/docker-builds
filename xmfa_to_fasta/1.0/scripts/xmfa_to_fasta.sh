#!/bin/bash

# This script pushes an XMFA file through a few scripts to generate a FastA alignment.

# Set the default value of the flag variable
HELP=false

usage() {
  echo "
Generate a FastA alignment file from an (optionnally gzipped) XMFA alignment file.
Usage: ${0##*/} -i InputFile -o OutputFile [-hp]
Required:
  -i                An XMFA-formatted alignment file.

Optional:
  -h                 Show this help message and exit.
  -p                 Input is in ParSNP XMFA format.
  -o                 Output file. Output file will be
                     overwritten if already present.
  "
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

# Parse arguments
while getopts "i:hpo:" opt; do
  case "${opt}" in
    i ) I="$OPTARG"
      ;;
    h ) HELP=true
      ;;
    p ) PARSNP=true
      ;;
    o ) O="$OPTARG"
      ;;
    \?) echo "Invalid option specified." >&2
      usage
      exit 1
      ;;
  esac
done

if [[ $HELP = true ]]; then
  usage
  exit 0
fi

# Clear any existing output file
rm -f $O

# Unzip input if gzipped
if [[ $I == *.gz ]]; then
  gunzip $I
  I="${I%.*}"
fi

# Standardize XMFA headers
if [[ "$PARSNP" ]]; then
  standardize_xmfa_headers.sh $I $I.tmp
else
  mv $I $I.tmp
fi

# Convert XMFA to FastA
convertAlignment.pl -i $I.tmp -o $O.tmp -f fasta -g xmfa -c

# Remove suffix from headers
sed "s/\/[0-9]*-[0-9]*$//" $O.tmp > $O

# Remove temp files
rm -f $I.tmp $O.tmp