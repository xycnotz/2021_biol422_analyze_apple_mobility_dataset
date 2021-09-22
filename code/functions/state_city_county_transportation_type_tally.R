# the goal of this script is to use the dplyr package to count up the
# number f cities and counties in a given state that have detialed
# Apple mobility data available and then eventually to save it to csv

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 21, 2021

# load the package "dplyr"
library("dplyr")
library("tools")

state_transportation_tally <- function(state_data) {
  # load in the dataset from the previous script
  # because state names have spaces removed in file name, space needs to be
  # replaced with a "-" to be in line with naming
  input_file <- paste0("output/applemobilitytrends-2021-09-20_",
                       gsub("\\s", "-", state), ".csv")

  ## TODO: add defnesive programming if statement to prevent bad calls

  state_data <- read.csv(input_file)

  # starting off with dplyr chains
  count_cities_counties <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # write out the result of the dplyr chain to csv
  write.csv(count_cities_counties,
            paste0("output/", file_path_sans_ext(basename(input_file)),
                   "_cities_counties_counts", ".csv"))
}
