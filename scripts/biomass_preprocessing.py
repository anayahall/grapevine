
# coding: utf-8

# In[33]:

# Script to clean pre-process BIOMASS INVENTORY and make spatial

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

# only for jupyter nb to show plots inline
# %matplotlib inline 

# print("*BIOMASS PREPROCESSING SCRIPT BEGINS*")
def epsg_meters(gdf, proj=26911):
    g = gdf.copy()
    g = g.to_crs(epsg=proj)
    return g


# In[4]:

#check wd
#print(os.getcwd())

#change wd
os.chdir("/Users/anayahall/projects/grapevine")

#read in biomass inventory
# GROSS inventory
gbm = pd.read_csv("data/raw/biomass.inventory.csv")

# TECHNICAL inventory
tbm = pd.read_csv("data/raw/biomass.inventory.technical.csv")


# In[77]:

gbm.head()
tbm.head()

gbm.columns

# check that all counties in there
len(gbm.COUNTY.unique())
#yup, plus one "other"


# In[78]:

# EXPLORE DATA
gbm['biomass.category'].value_counts()
# same as technical


# In[79]:

gbm['biomass.feedstock'].value_counts().head()
# same as technical
# tbm['biomass.feedstock'].value_counts().head()


# In[80]:

gbm[gbm['disposal.yields'] == gbm['disposal.yields'].max()]


# In[81]:

#look at just manure (if feedstock, needs to be capitalized), if category, lower case -- should be equivalent!
gbm[(gbm['biomass.feedstock'] == "MANURE") & (gbm['year'] == 2014)].head()


# In[82]:

#start grouping by: biomass category
gbm.groupby(['biomass.category'])['disposal.yields'].sum()


# In[83]:

gbm[gbm['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()


# In[37]:

# now load SHAPEFILE for all CA COUNTIES to merge this
print("read in CA COUNTIES shapefile and reproject")
CA_proj = gpd.read_file("data/raw/CA_Counties/CA_Counties_TIGER2016.shp")
CA_proj.head()

CA = epsg_meters(CA_proj)
CA.head()


# In[85]:

# type(CA)


# In[38]:

# Create new geoseries of county centroids - 
# note, technically still a panda series until 'set_geomtry()' is called
CA['cocent'] = CA['geometry'].centroid
CA.tail()


# In[39]:

# both set geometry (see above) and plot to check it looks right
CA.set_geometry('cocent').plot()


# In[40]:

# CREATE FIPS ID to merge with county names
#CAshape.FIPS = str(CAshape.STATEFP) + str(CAshape.COUNTYFP)
CA['FIPS']=CA['STATEFP'].astype(str)+CA['COUNTYFP']

# get rid of leading zero
CA.FIPS = [s.lstrip("0") for s in CA.FIPS]

#convert to integer for merging below
CA.FIPS = [int(i) for i in CA.FIPS]
CA.head()


# In[41]:

# NEED TO BRING IN COUNTY NAMES TO MERGE WITH BIOMASS DATA
countyIDs = pd.read_csv("data/interim/CA_FIPS.csv", names = ["FIPS", "COUNTY", "State"])
countyIDs

type(countyIDs.FIPS[0])
type(CA.FIPS[0])

CAshape = pd.merge(CA, countyIDs, on = 'FIPS')

CAshape.head()


# In[42]:

# Create subset of just county centroid points NOT POLYGONS
CAshape.head()

CA_pts = CAshape.set_geometry('cocent')[['cocent','FIPS', 'COUNTY', 'ALAND', 'AWATER']]

# type(CA_pts)

# CA_pts.plot()
# CA_pts.head()


# In[91]:

# type(CAshape)


# In[43]:

# now can merge with biomass data finally!!!
gbm.columns
print("merging biomass data with CA shapefile")

#POLYGONS
gbm_shp = pd.merge(CAshape, gbm, on = 'COUNTY')
# Do same for technical biomass
tbm_shp = pd.merge(CAshape, tbm, on = 'COUNTY')

# COUNTY CENTROIDS

gbm_pts = pd.merge(CA_pts, gbm, on = 'COUNTY')
tbm_pts = pd.merge(CA_pts, tbm, on = 'COUNTY')


# In[45]:

# tbm_pts.plot()


# In[94]:

# type(tbm_shp)
# tbm_shp.tail()

# Create subset of shapefile to see it it saves any faster
# tbm_subshp = tbm_shp[tbm_shp['biomass.category'] == 'manure']


# In[95]:

# type(tbm_subshp)


# In[46]:

# export as SHAPEFILE

start = time.time()


print("starting export")

gbm_out = r"/Users/anayahall/projects/grapevine/data/clean/grossbiomass_pts.shp"
tbm_out = r"/Users/anayahall/projects/grapevine/data/clean/techbiomass_pts.shp"

print("saving inventories as shapefile with county centroid pts")
gbm_pts.to_file(driver='ESRI Shapefile', filename=gbm_out)
tbm_pts.to_file(driver='ESRI Shapefile', filename=tbm_out)

end = time.time()
print(end - start)



print("BIOMASS PRE_PROCESSING DONE RUNNING")

