# Biomass Inventory for Project Grapevine
# Anaya Hall
# this script loads biomass inventory csvs for all counties in California
# Data from Breunig et al 2017 
# February 2019

library(tidyverse)
library(dplyr)


#set project wd
setwd("/Users/anayahall/projects/grapevine")

# Load both datasets
biomass_gross <- read_csv("data/biomass.inventory.csv")
biomass_tech <- read_csv("data/biomass.inventory.technical.csv")

county_list <- unique(biomass_gross$COUNTY)

category_list <- unique(biomass_gross$biomass.category)

# maybe try to plot?
png("test.png", width = 960, height = 960)
par(mfrow = c(2, 5))  # Set up a 2 x 2 plotting space

for (i in seq_along(category_list)) {
  t <- biomass_all %>% filter(biomass.category == category_list[i])
  #plot(x = t$year, y = t$disposal.yields) }
  p <- ggplot(data = t, aes(x= year, y = disposal.yields, color = COUNTY)) +
    geom_point() + theme(legend.position="none") 
  #+
       # ggtitle(paste(i, ' Biomass Category \n', 
       #            "Disposal Yield by County \n",
       #            sep=''))
  print(p) }
  
dev.off()
  
