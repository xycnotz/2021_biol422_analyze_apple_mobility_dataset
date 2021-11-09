# The goal of this script is to take in the state subset data and convert it
# to long form from wide form then write out the new dataframe
# to a file in output/subsetted_states_long

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 29, 2021

# Load up the library package dplyr
library("dplyr")

state_data_to_long <- function(file) {
  ## load the data from the 01 script to convert the wide data to long
  state_data <- readr::read_csv(file)

  ## As data has the date pattern of YYYY-MM-DD, select all the columns with a
  ## year in the column name.
  longer_data <- tidyr::pivot_longer(state_data,
                                     cols = matches("20[0-9][0-9]-"))
  longer_data <- longer_data %>% rename(sub_region = `sub-region`,
                                        relative_mobility = value,
                                        date = name)
  readr::write_csv(longer_data,
                   paste0("output/subsetted_states_long/",
                          tools::file_path_sans_ext(basename(file)),
                          "_long.csv"))
  return(longer_data)

}
