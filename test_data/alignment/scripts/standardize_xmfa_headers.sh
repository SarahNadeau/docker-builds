#!/bin/bash

# This script corrects the headers in an XMFA alignment file to match file names from prefix.
# It was motivated by ClonalFrameML needing treefile sequence names to match XMFA headers.
# $1=filename; $2=outfile

# Usage
usage() {
  echo "
Usage: ${0##*/} InputFile [OutputFile] [-h|--help]
Required:
  <InputFile>        An XMFA-formatted alignment file.

Optional:
  -h | --help        Show this help message and exit.
  <OutputFile>       Output file. Output file will be
                     overwritten if already present.
                     Default: '<InputFile>.matchednames'.
  "
  }

# Help
if [[ "$1" == "--help" || "$1" == "-h" || ! -f "$1" ]]; then
  usage
  exit 0
fi

# Make output file
if [ -z "$2" ]; then
  O="$1".matchednames
else
  O=$2
fi
cp $1 $O

# Read through XMFA prefix block, replacing headers for each SequenceFile name
i=0
while read p; do
  if echo "$p" | grep -q "^##SequenceFile"; then
    i=$((i + 1))
    FILENAME=$( echo "$p" | awk '{print $2}' )
    echo "
    Original:
      >$i:
    Replacement:
      >$FILENAME:"
    sed -i.bak "s/>$i:/>$FILENAME:/g" $O
  elif ! echo "$p" | grep -q "^#"; then
    break
  fi
done < $1

# Remove temporary sed backup file
rm $O.bak