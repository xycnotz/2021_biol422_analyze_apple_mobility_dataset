#!/bin/sh

# count the number of entries here:
zcat /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz | zgrep ">" | wc -l
# generic check all entries
zgrep ">" $1| wc -l  > # assign to a file?
# try to write out a grep version of the file for easier iteration 
zgrep ">" $1| cut -d "|" -f 3 | sort -g | uniq -d > # assign to file
# read in above file as an array and use a for loop to count via awk
# remove everything except country and count entries based on country, will require a for loop with a list of countries
zcat /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz | zgrep ">" | cut -d "|" -f 3 | awk 'BEGIN{s = 0}; $0 == "Thailand"{s+=1}; END{print s}'
# write out all entries concatenated to a txt
# read in txt then sort numerically 

# use bioawk to count the bp of each sequence and report lengths ><29000
