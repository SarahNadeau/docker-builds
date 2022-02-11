#!/bin/bash

# This script corrects the headers in an XMFA alignment file to have numeric labels and the sequence name in the comment field.
# It was motivated by Lee Katz's convertAlignment.pl script needing a particular input XMFA format.
# $1=filename; $2=outfile

# Usage
usage() {
  echo "
Correct the headers in an XMFA alignment file to have numeric labels and the sequence name in the comment field.
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
rm -f $O
cp $1 $O

# Read through XMFA prefix block, replacing headers for each SequenceFile name
i=0
while read p; do
  if echo "$p" | grep -q "^##SequenceFile"; then
    i=$((i + 1))
    FILENAME=$( echo "$p" | awk '{print $2}' )
    echo "Standardizing entries for: $FILENAME"
    # Put the sequence name in the header comment field
    awk -v f="$FILENAME" -v i="$i" '{if ($1~f) gsub($3,f); print}' $O > $O.tmp && mv $O.tmp $O
    # If label is sequence name, change to be numeric index
    if grep -q "^>$FILENAME" $O; then
      sed -i.bak "s/^>$FILENAME:/>$i:/g" $O
    fi
  elif ! echo "$p" | grep -q "^#"; then
    break
  fi
done < $1

rm $O.bak