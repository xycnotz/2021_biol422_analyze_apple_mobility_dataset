#!/bin/sh

set -euo pipefail

# This bash script is used to calculate the total number of SARS-CoV2 sequences
# as well as show the number of sequences isolated in each country in
# reverse numeric order

# This script expects one command line paramter for the path to the
# compressed FASTA file

# Xienyam Chiu
# November 07, 2021
# xchiu@dons.usfca.edu

if [ $# -eq 0 ]
then
	echo "Please supply up to two arguments to run this script"
	echo "This script expect the path to the compressed FASTA file as the first argument."
	echo "The second argument please enter \"ALL\" if you want a verbose log of the script."
	exit 1
elif [ $# -ge 3 ]
then
	echo "This script only accepts up two two arguments."
	echo "Please check if you entered any extra arguments."
	exit 1
else
	if [ $# -eq 2 ] && [ "$2" = "ALL" ]
	then
		# Count the number of SARS-CoV2 sequences
		echo "Beginning total SARS-CoV2 sequnce tally"
		echo "Total SARS-CoV2 sequences: $(zgrep ">" "$1"| wc -l)"  > output/final_output_verbose.txt
		echo "Sequence count complete"

		# Count up all the SARS-CoV2 sequences by country and sort in descending order
		echo "Beginning SARS-CoV2 sequence tally by country"
		zgrep ">" "$1"| cut -d "|" -f 21 | sort | uniq -c | sort -nr >> output/final_output_verbose.txt
		echo "Country sequence tally complete"
	else
		zgrep ">" "$1"| cut -d "|" -f 21 | sort | uniq -c | sort -nr >> output/final_output.txt
	fi
fi
