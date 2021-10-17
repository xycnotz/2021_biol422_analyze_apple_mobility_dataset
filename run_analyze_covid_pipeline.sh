#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell
# this script expects two command line parameters
# the first should be a US state, and the second is the raw apple moblilty
# data csv file downloaded from apple.com

# Xienyam Chiu
# October 17, 2021
# xchiu@dons.usfca.edu

Rscript -e "rmarkdown::render('analyze_apple_mobility_dataset.rmd', \
            params = list(state = '$1', \
            data = '$2'))"
