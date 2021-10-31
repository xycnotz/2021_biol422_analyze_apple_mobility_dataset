#!/bin/sh

# This bash script is used to calculate the total number of SARS-CoV2 sequences
# as well as show the number of sequences isolated in each country in
# reverse numeric order

# This script expects one command line paramter for the path to the
# compressed FASTA file

# Xienyam Chiu
# October 31, 2021
# xchiu@dons.usfca.edu

if [ $# -eq 0 ]
then
	echo "Please supply one argument to run this script"
	echo "This script expect the path to the compressed FASTA file."
	exit 1
fi

# Count the number of SARS-CoV2 sequences
echo "Beginning total SARS-CoV2 sequnce tally"
echo "Total SARS-CoV2 sequences: $(zgrep ">" "$1"| wc -l)"  > output/final_output.txt
echo "Sequence count complete"

# Count up all the SARS-CoV2 sequences by country and sort in descending order
echo "Beginning SARS-CoV2 sequence tally by country"
zgrep ">" "$1"| cut -d "|" -f 21 | sort | uniq -c | sort -nr >> output/final_output.txt
echo "Country sequence tally complete"
