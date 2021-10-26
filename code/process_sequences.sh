#!/bin/sh
zcat /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz | zgrep ">" | wc -l
