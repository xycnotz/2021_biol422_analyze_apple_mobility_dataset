# the goal of this script is to use the dplyr package to count up the
# number f cities and counties in a given state that have detialed
# Apple mobility data available and then eventually to save it to csv

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 21, 2021

# load the package "dplyr"
library("dplyr")

# we would like to get a count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted.

# load in the dataset from the previous script
input_file <- "output/applemobilitytrends-2021-09-13_Florida.csv"
state_data <- read.csv(input_file)

# starting off with dplyr chains
count_of_cities_counties <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()

# write out the result of the dplyr chain to csv
write.csv(count_of_cities_counties, "output/florida_cities_counties_counts.csv")
