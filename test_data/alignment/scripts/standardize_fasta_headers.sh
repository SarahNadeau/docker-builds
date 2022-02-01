#!/bin/bash

# This script corrects the headers in an FastA alignment file to remove the suffix /<start>-<stop position>.
# It was motivated by Lee Katz's convertAlignment.pl script adding that suffix.
# $1=filename; $2=outfile

# Usage
usage() {
  echo "
Correct the headers in an FastA alignment file to remove the suffix /<start>-<stop position>.
Usage: ${0##*/} InputFile [OutputFile] [-h|--help]
Required:
  <InputFile>        A FastA-formatted alignment file.

Optional:
  -h | --help        Show this help message and exit.
  <OutputFile>       Output file. Output file will be
                     overwritten if already present.
                     Default: '<InputFile>.desuffixed'.
  "
  }

# Help
if [[ "$1" == "--help" || "$1" == "-h" || ! -f "$1" ]]; then
  usage
  exit 0
fi

# Make output file
if [ -z "$2" ]; then
  O="$1".desuffixed
else
  O=$2
fi
rm -f $O

# Remove suffix from headers
sed "s/\/[0-9]*-[0-9]*$//" $1 > $O