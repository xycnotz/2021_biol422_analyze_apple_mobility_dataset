# Script to read in Apple mobility data from a csv file
# and subset the data to just inclue rows from the state Florida
# and then write out a csv file that only has that subset

# Xienyam Chiu
# xchiu@dons.usfca.edu
# September 01, 2021

# read in the complete csv file
full_covid_data <- read.csv("data/data_raw/applemobilitytrends-2021-08-30.csv")

# subset the dataset to only include rows where sub.region has "Florida"
# in it.
florida_covid_data <- full_covid_data[full_covid_data$sub.region == "Florida", ]

# save Florida subset data to a CSV file in the output directory
write.csv(florida_covid_data,
          file = "output/2021-08-31_florida-covid-mobility-data.csv")
