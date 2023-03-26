source("/Users/frank/Documents/GitHub/Useful-code/load.packages.R")

# Set the path of the folder containing the Excel files
folder_path <- "/Users/frank/Documents/GitHub/HousingPrices-Stockholm-1/"
# Get a list of file names with the .xlsx extension
file_names <- list.files(path = folder_path, pattern = "*.xlsx")

# Initialize an empty data frame to store the combined data
month_data <- data.frame()
year_data <- data.frame()
room_data <- data.frame()


for (file_name in file_names) {
  
  file_path <- paste0(folder_path, file_name)
  id_name = gsub("Svensk Mäklarstatistik Bostadsrätter ", "", file_name)
  
  #read excel and add identifier column
  month <- read_excel(file_path, sheet = "48 mån", skip = 2) %>% 
    mutate(Area = gsub(".xlsx", "", gsub("Svensk Mäklarstatistik Bostadsrätter ", "", file_name)))
  year <- read_excel(file_path, sheet = "Årshistorik", skip = 2) %>% 
    mutate(Area = gsub(".xlsx", "", gsub("Svensk Mäklarstatistik Bostadsrätter ", "", file_name)))
  room <- read_excel(file_path, sheet = "Pris | Rum", skip = 2) %>% 
    mutate(Area = gsub(".xlsx", "", gsub("Svensk Mäklarstatistik Bostadsrätter ", "", file_name)))
  

  # Combine the data into the existing data frame
  month_data <- rbind(month_data, month)
  year_data <- rbind(year_data, year)
  room_data <- rbind(room_data, room)

}
rm(list = setdiff(ls(), c("room_data", "year_data", "month_data")))

month_data$Area <- gsub("Svensk Mäklarstatistik Bostadsrätter", "", month_data$Area)
year_data$Area <- gsub("Svensk Mäklarstatistik Bostadsrätter", "", year_data$Area)
room_data$Area <- gsub("Svensk Mäklarstatistik Bostadsrätter", "", room_data$Area)
