# the goal of this script is to use the dplyr package to count up the
# number f cities and counties in a given state that have detialed
# Apple mobility data available and then eventually to save it to csv
# Uses functions in the code/functions directory

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 21, 2021

# we would like to get a count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted.

# load functions
source("code/functions/state_city_county_transportation_type_tally.R")

# call function for multiple states
for (state in c("Florida", "Alabama",
                "North Carolina", "Idaho",
                "Nebraska", "New York")) {
  state_transportation_tally(state)
}
