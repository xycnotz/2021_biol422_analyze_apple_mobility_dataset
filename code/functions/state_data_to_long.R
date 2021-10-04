##take in 01 csvs to change into long form
longer_state <- function(file, column_data) {
  ## load the data from the 01 script to convert the wide data to long
  state_data <- readr::read_csv(file)

  ## As data has the date pattern of YYYY-MM-DD, select all the columns with a
  ## year in the column name.
  longer_data <- tidyr::pivot_longer(state_data,
                                     cols = contains(c("2020", "2021")))
  longer_data <- dplyr::rename(longer_data, sub_region = `sub-region`)
  readr::write_csv(longer_data,
                   paste0("output/",
                          tools::file_path_sans_ext(basename(file)),
                          "_long.csv"))
  return(longer_data)

}
