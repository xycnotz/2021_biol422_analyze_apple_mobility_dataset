#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell

Rscript -e "rmarkdown::render('analyze_apple_mobility_dataset.rmd')"
