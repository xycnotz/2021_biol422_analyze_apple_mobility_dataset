# the goal of this script is to use the dplyr package to count up the
# number f cities and counties in a given state that have detialed
# Apple mobility data available and then eventually to save it to csv

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 21, 2021

# load the package "dplyr"
library("dplyr")

state_transportation_tally <- function(state_data) {
  # load in the dataset from the previous script
  # because state names have spaces removed in file name, space needs to be
  # replaced with a "-" to be in line with naming
  input_file <- paste0("output/applemobilitytrends-2021-09-20_",
                       gsub("\\s", "-", state), ".csv")

  # TODO: add defensive programming if statement to prevent bad calls
  # Check if current file directory is present in the output folder
  # If file does not exist in current path, stop the function
  if (file.exists(input_file) == FALSE) {
    stop("ERROR: This file does not exist. Was there a typo in the state name?")
  }
  state_data <- readr::read_csv(input_file)

  # Prevent any empty csv files from running in the script
  if (nrow(state_data) == 0) {
    stop("ERROR: This file contained no data rows. Please check the output csv")
  }
  else {
    # starting off with dplyr chains
    count_cities_counties <- state_data %>%
      select(geo_type, region, transportation_type) %>%
      group_by(geo_type, transportation_type) %>%
      tally()

    # write out the result of the dplyr chain to csv
    readr::write_csv(count_cities_counties,
              paste0("output/", tools::file_path_sans_ext(basename(input_file)),
                     "_cities_counties_counts", ".csv"))
  }
}
