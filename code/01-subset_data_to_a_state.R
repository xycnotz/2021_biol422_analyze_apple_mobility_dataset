# Script to read in Apple mobility data from a csv file
# and subset the data to just inclue rows from the state Florida
# and then write out a csv file that only has that subset
# Uses functions in the code/functions directory

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 14, 2021

# load functions
source("code/functions/state_subset_mobility_data.R")

# test out the use of the function
state_subset_mobility_data(
  input_file_name = "data/data_raw/applemobilitytrends-2021-09-13.csv",
  state_to_subset = "Florida")
