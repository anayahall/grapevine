#PEEL!
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(tidyverse)

setwd("/Users/anayahall/projects/grapevine")
comp_sites <- read_csv("data/compostsites.csv", skip=1,
                       col_names = c("name", "id", "type", "status", "address", "city", "lat", "long"))


open_sites <- subset(comp_sites, status != "OPEN - CLOSED/WITH MONITORING" & name != "PEBBLY BEACH LANDFILL")

states <- map_data("state")
ca_df <- subset(states, region =="california")  

png("plots/compost_plot.png", width = 3000, height = 4000, bg = NA)

ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "blue", fill = "white") + 
  geom_point(data = open_sites, mapping = aes(x = long, y = lat), color = "orange1", size = 15) +
  theme_void()

ca_base

#dev.copy(ca_base,'TEST.png')
dev.off()


# 
# dev.copy(png,'myplot.png')
# dev.off()
