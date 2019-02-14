# Compost Sites for Project Grapevine
# Anaya Hall
# this script loads and cleans data files containing composting facilities in California

# Origninally created for nrt poster using waterboard data (compostsites.csv) - September 2018
# February 2019 -- amended to utilize EPA Region 9 composting facilities from ExcessFoodMap

# load libraries
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(tidyverse)
library(dplyr)

#set project wd
setwd("/Users/anayahall/projects/grapevine")

# grab state maps for plotting later
states <- map_data("state")
counties <- map_data(map = "county", region = "california") #, region == "california")
# just want CA
CA <- subset(states, region =="california")  

###############################################################################################################

# load original data
comp_sites <- read_csv("data/compostsites.csv", skip=1,
                       col_names = c("name", "id", "type", "status", "address", "city", "lat", "long"))

# filter to only open/active 
open_sites <- subset(comp_sites, status != "OPEN - CLOSED/WITH MONITORING")

###############################################################################################################


# Load EPA DATA (EXCESSFOODMAP) 
allFacilities <- readxl::read_excel('data/EXCESSFOODPUBLIC_USTER_2015_R9.GDB/ExcelTables/Composting Facilities.xlsx', 
                                    sheet = 2)
CAfacilities <- allFacilities %>% filter(State == "CA")

# Need to GEOCODE
#https://www.r-bloggers.com/batch-geocoding-with-r-and-google-maps/

# FIRST Register w Google maps and set up API Key
  # devtools::install_github("dkahle/ggmap")
  # register_google("AIzaSyDMg1LIYzqPk8sAZD0OKqMTBjhZmlEzLig")
  # ggmap_credentials()

# street_addresses <- CAfacilities$Address
# cities <- CAfacilities$City
# 
# full_addresses <- paste0(street_addresses, ", ", cities)
# 
# # get lat long and bind to df
# epa_sites_geo <- cbind(CAfacilities, geocode(full_addresses))

#save as separate csv for late
#write_csv(epa_sites_geo, "data/epa_facilities_geocoded.csv")

epa_sites_geo <- read_csv("data/epa_facilities_geocoded.csv")

###############################################################################################################
# CalRecycle's SWIS Inventory
# This dataset is already geotagged and also contains information on CAPACITY

library(readxl)    

#function to load all sheets
read_excel_allsheets <- function(filename, tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}

#load all three sheets of Cal Recycle's SWIS dataset
swis <- read_excel_allsheets("data/SWIS.xls")

# Join
swis_comp <- inner_join(x= swis$Site, y = swis$Unit)

#filter to composting
CR_sites <- swis_comp %>% filter(str_detect(Activity, "Compost") & OperationalStatus == "Active")

write_csv(CR_sites, "data/CR_compostFacilities.csv")

###############################################################################################################
# Plot and compare data sources

png("plots/compost_comparison.png", width = 1000, height = 1200, units = "px")

g <- ggplot(data = CA, mapping = aes(x = long, y = lat)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "white") + 
 #  geom_polygon(data = counties, aes(fill=region), color = "grey", fill = "white") +
  geom_point(data = open_sites, mapping = aes(x = long, y = lat), color = "orange1", size = 5, alpha=.5) +
  geom_point(data = epa_sites_geo, aes(x=lon, y=lat), color = "blue", size = 5, alpha=.5) +
  geom_point(data = CR_sites, aes(x = Longitude, y = Latitude), color = "green", size = 5, alpha=.5) +
  theme_minimal()

# NOTE : UniqueID == CPL01135 is on Catalina Island! 
# print map
g

dev.off()

