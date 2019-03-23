
# coding: utf-8

# In[ ]:

# Script to clean pre-process BIOMASS INVENTORY and make spatial

# First, load packages
import pandas as pd
import os
import numpy as np
import shapely as sp
import fiona

import matplotlib.pyplot as plt
import geopandas as gpd
from geopandas import GeoSeries, GeoDataFrame

import plotly.plotly as py

# only for jupyter nb to show plots inline
#%matplotlib inline 

print("*BIOMASS PREPROCESSING SCRIPT BEGINS*")


# In[ ]:

#check wd
#print(os.getcwd())

#change wd
os.chdir("/Users/anayahall/projects/grapevine")

#read in biomass inventory
# GROSS inventory
gbm = pd.read_csv("data/raw/biomass.inventory.csv")

# TECHNICAL inventory
tbm = pd.read_csv("data/raw/biomass.inventory.technical.csv")


# In[ ]:

gbm.head()
tbm.head()

gbm.columns

# check that all counties in there
len(gbm.COUNTY.unique())
#yup, plus one "other"


# In[ ]:

gbm['biomass.category'].value_counts()
# same as technical


# In[ ]:

gbm['biomass.feedstock'].value_counts().head()
# same as technical
# tbm['biomass.feedstock'].value_counts().head()


# In[ ]:

gbm[gbm['disposal.yields'] == gbm['disposal.yields'].max()]


# In[ ]:

#look at just manure (if feedstock, needs to be capitalized), if category, lower case -- should be equivalent!
gbm[(gbm['biomass.feedstock'] == "MANURE") & (gbm['year'] == 2014)].head()


# In[ ]:

#start grouping by: biomass category

gbm.groupby(['biomass.category'])['disposal.yields'].sum()


# In[ ]:

gbm[gbm['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()


# In[ ]:

# now load shapefile for CA counties to merge this

#UScounties = fiona.open("data/raw/tl_2018_06_tract/tl_2018_06_tract.shp")
print("read in county shapefile")
CA = gpd.read_file("data/raw/tl_2018_06_tract/tl_2018_06_tract.shp")


# In[ ]:

CA.tail()


# In[ ]:

# CREATE FIPS ID to merge with county names
#CAshape.FIPS = str(CAshape.STATEFP) + str(CAshape.COUNTYFP)
CA['FIPS']=CA['STATEFP'].astype(str)+CA['COUNTYFP']

# get rid of leading zero
CA.FIPS = [s.lstrip("0") for s in CA.FIPS]

#convert to integer for merging below
CA.FIPS = [int(i) for i in CA.FIPS]


# In[ ]:

# NEED TO BRING IN COUNTY NAMES TO MERGE WITH BIOMASS DATA
countyIDs = pd.read_csv("data/interim/CA_FIPS.csv", names = ["FIPS", "COUNTY", "State"])
countyIDs

type(countyIDs.FIPS[0])
type(CA.FIPS[0])

CAshape = pd.merge(CA, countyIDs, on = 'FIPS')

CAshape.head()


# In[ ]:

type(CAshape)


# In[ ]:

# now can merge with biomass data finally!!!
gbm.columns
print("merging biomass data with CA shapefile")

gbm_shp = pd.merge(CAshape, gbm, on = 'COUNTY')

# Do same for technical biomass
tbm_shp = pd.merge(CAshape, tbm, on = 'COUNTY')


# In[28]:

type(tbm_shp)
tbm_shp.tail()


# tbm_shp[tbm_shp['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()
tbm_subshp = tbm_shp[tbm_shp['biomass.category'] == 'manure']


# In[29]:

type(tbm_subshp)


# In[31]:

# export as SHAPEFILE
print("starting export")

gbm_out = r"/Users/anayahall/projects/grapevine/data/clean/grossbiomass.shp"
tbm_out = r"/Users/anayahall/projects/grapevine/data/clean/techbiomass.shp"


# gbm_shp.to_file(driver='ESRI Shapefile', filename=gbm_out)
tbm_subshp.to_file(driver='ESRI Shapefile', filename=tbm_out)

print("DONE RUNNING -- come back to play with grouping and/or plotting")


# In[ ]:



