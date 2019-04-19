#checking gross v tech biomass
# First, load packages
import pandas as pd
import os
import numpy as np
import shapely as sp
import fiona
import time
import matplotlib.pyplot as plt
import geopandas as gpd
from geopandas import GeoSeries, GeoDataFrame
import plotly.plotly as py


#change wd
os.chdir("/Users/anayahall/projects/grapevine")

from fxns import epsg_meters
##################################################################
#read in biomass inventory
# # GROSS inventory
# gbm = pd.read_csv("data/raw/biomass.inventory.csv")

# # TECHNICAL inventory
# tbm = pd.read_csv("data/raw/biomass.inventory.technical.csv")

ej = gpd.read_file("data/calenviroscreen/CESJune2018Update_SHP/CES3June2018Update.shp")

ej.plot()