# Script to read in Apple mobility data from a csv file
# and subset the data to just inclue rows from the state Florida
# and then write out a csv file that only has that subset

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 14, 2021

# create a function to subset any US state out of the full dataset
# this should also create an output CSV file named corresponding to the state
# that is subsetted
library("dplyr")
state_subset_mobility_data <- function(input_file_name, state_to_subset) {
  # read in the complete csv file
  full_covid_data <- readr::read_csv(file = input_file_name,
                                     show_col_types = FALSE)

  # subset the dataset to only include rows where sub.region matches the given
  # state

  state_data <- full_covid_data %>% filter(`sub-region` == state_to_subset)

  # Check if subsetted data has any data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: No rows matching give state name. Was a typo made?")
  }
  else{
    # Remove any spaces from name with "-" to prevent any parsing errors
    # Save state subset data to csv file in the output directory
    readr::write_csv(state_data, file = paste0("output/subsetted_states_wide/",
                                        tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                        "_",
                                        gsub("\\s", "_", state_to_subset),
                                        ".csv"))
    return(state_data)
  }
}
