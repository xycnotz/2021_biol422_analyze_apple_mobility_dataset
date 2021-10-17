#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell

Rscript -e "rmarkdown::render('analyze_apple_mobility_dataset.rmd', \
            params = list(state = 'Florida', \
            data = '/data/data_raw/applemobilitytrends-2021-09-20.csv'))"
