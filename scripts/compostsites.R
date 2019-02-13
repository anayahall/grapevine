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
# just want CA
ca_df <- subset(states, region =="california")  

###############################################################################################################

# load original data
comp_sites <- read_csv("data/compostsites.csv", skip=1,
                       col_names = c("name", "id", "type", "status", "address", "city", "lat", "long"))

# filter to only open/active 
open_sites <- subset(comp_sites, status != "OPEN - CLOSED/WITH MONITORING" & name != "PEBBLY BEACH LANDFILL")

###############################################################################################################

# Prepare to plot on png
png("plots/compost_plot.png", width = 3000, height = 4000, bg = NA)

# create map of sites ove CA 
ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "white") + 
  geom_point(data = open_sites, mapping = aes(x = long, y = lat), color = "orange1", size = 15) +
  theme_void()

# print map
ca_base

#dev.copy(ca_base,'TEST.png')
dev.off()

###############################################################################################################
#

# Load EPA DATA (EXCESSFOODMAP) 
allFacilities <- readxl::read_excel('data/EXCESSFOODPUBLIC_USTER_2015_R9.GDB/ExcelTables/Composting Facilities.xlsx', 
                                    sheet = 2)
CAfacilities <- allFacilities %>% filter(State == "CA")
