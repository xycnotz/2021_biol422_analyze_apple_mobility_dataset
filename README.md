# Analysis of the Apple Mobility Data during COVID-19

Xienyam Chiu  
xchiu@dons.usfca.edu  

## Project Aims
The aim of this project is to analyze the mobility data provided by Apple from Apple Maps requests.

This data is available from the following URL:
https://covid19.apple.com/mobility

### Change Log
* 2021-10-05: Updated Rmarkdown file and revised functions to fix previous syntax errors
* 2021-10-04: Created Rmarkdown file to make a report of analysis
* 2021-09-29: Created function to convert subset data from wide to long format
* 2021-09-24: Added defensive programming to transportation type function to prevent loading nonexistent or empty data files
* 2021-09-22: Created Github repository for project and pushed commits to Github
* 2021-09-21: Added second script to tally up cities and counties using dplyr for a given state for different transportation types.
* 2021-09-20: Initialize git repository for the project.
* 2021-09-19: Refactored code to call in subset function from a different file.
* 2021-09-14: A new version of the data file was downloaded. Code was refactored to be more general and allow for any state to be subset from the larger file.
* 2021-08-31: Data was originally downloaded for analysis.
