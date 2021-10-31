#!/bin/sh

# count the number of entries here:
zcat /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz | zgrep ">" | wc -l
# generic check all entries
zgrep ">" $1| wc -l  > final_output.txt
# try to write out a grep version of the file for easier iteration 

# assign to file
zgrep ">" $1| cut -d "|" -f 3 | sort -u # apparently same output as above, more accurate as fewer countries removed 
# read in above file as an array and use a for loop to count via awk
# final fasta file has country at index 21


# remove everything except country and count entries based on country, will require a for loop with a list of countries


# write out all entries concatenated to a txt
# read in txt then sort numerically 

mapfile -t array_name < unique_countries.txt
for ((i= 0; i < ${#array_name[@]}; i++))
do
	echo -n "${array_name[$i]} "
	zgrep "${array_name[$i]}" $1| wc -l>> 
	# append to txt file
done

# sort output based on number count 
sort -k 2nr output_file.txt >> final_output.txt

# use bioawk to count the bp of each sequence and report lengths ><29000
