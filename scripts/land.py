
# coding: utf-8

# In[2]:

# Reading in Rasters
# Rasterio tutorial here: 
#https://automating-gis-processes.github.io/CSC18/lessons/L6/reading-raster.html

# First, load packages
import pandas as pd
import os
import fiona
import rasterio
from rasterio.mask import mask
from rasterio.plot import show
import numpy as np
import shapely as sp
import geopandas as gpd
from fiona.crs import from_epsg
import pycrs

os.chdir("/Users/anayahall/projects/grapevine")

from fxns import epsg_meters
import matplotlib.pyplot as plt

# from geopandas import GeoSeries, GeoDataFrame
# # only for jupyter nb to show plots inline
# get_ipython().magic('matplotlib inline')


# now load SHAPEFILE for all CA COUNTIES to merge this
county_wp = gpd.read_file("data/raw/CA_Counties/CA_Counties_TIGER2016.shp")

print(county_wp.crs)
# county.head()

county = epsg_meters(county_wp)

print(county.crs)


# os.chdir("/Volumes/My Passport/CAland")
gl_wp = gpd.read_file("data/raw/CA_FMMP_G/gl_bycounty/grazingland_county.shp")
gl = epsg_meters(gl_wp)
gl.crs


# quick plot
gl.plot(ax=county.plot(cmap='Blues', figsize=(10, 6)), color = 'green')


# get area in meters
gl["area_km"] = gl['geometry'].area/ 10**6


# estimate centroid
gl['centroid'] = gl['geometry'].centroid


### CONVERT LAND AREA TO VOLUME OF COMPOST CAPACITY (*33.6cuyd/acre)