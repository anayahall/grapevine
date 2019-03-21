
# coding: utf-8

# In[1]:

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


# In[2]:

#check wd
#print(os.getcwd())

#change wd
os.chdir("/Users/anayahall/projects/grapevine")

#read in biomass inventory
# GROSS inventory
gbm = pd.read_csv("data/raw/biomass.inventory.csv")

# TECHNICAL inventory
tbm = pd.read_csv("data/raw/biomass.inventory.technical.csv")


# In[3]:

gbm.head()
tbm.head()

gbm.columns

# check that all counties in there
len(gbm.COUNTY.unique())
#yup, plus one "other"


# In[4]:

gbm['biomass.category'].value_counts()
# same as technical


# In[5]:

gbm['biomass.feedstock'].value_counts().head()
# same as technical
# tbm['biomass.feedstock'].value_counts().head()


# In[6]:

gbm[gbm['disposal.yields'] == gbm['disposal.yields'].max()]


# In[7]:

#look at just manure (if feedstock, needs to be capitalized), if category, lower case -- should be equivalent!
gbm[(gbm['biomass.feedstock'] == "MANURE") & (gbm['year'] == 2014)].head()


# In[8]:

#start grouping by: biomass category

gbm.groupby(['biomass.category'])['disposal.yields'].sum()


# In[9]:

gbm[gbm['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()


# In[10]:

# now load shapefile for CA counties to merge this

#UScounties = fiona.open("data/raw/tl_2018_06_tract/tl_2018_06_tract.shp")
print("read in county shapefile")
CA = gpd.read_file("data/raw/tl_2018_06_tract/tl_2018_06_tract.shp")


# In[36]:

CA.tail()


# In[12]:

# CREATE FIPS ID to merge with county names
#CAshape.FIPS = str(CAshape.STATEFP) + str(CAshape.COUNTYFP)
CA['FIPS']=CA['STATEFP'].astype(str)+CA['COUNTYFP']

# get rid of leading zero
CA.FIPS = [s.lstrip("0") for s in CA.FIPS]

#convert to integer for merging below
CA.FIPS = [int(i) for i in CA.FIPS]


# In[13]:

# NEED TO BRING IN COUNTY NAMES TO MERGE WITH BIOMASS DATA
countyIDs = pd.read_csv("data/interim/CA_FIPS.csv", names = ["FIPS", "COUNTY", "State"])
countyIDs

type(countyIDs.FIPS[0])
type(CA.FIPS[0])

CAshape = pd.merge(CA, countyIDs, on = 'FIPS')

CAshape.head()


# In[14]:

type(CAshape)


# In[28]:

# now can merge with biomass data finally!!!
gbm.columns
print("merging biomass data with CA shapefile")

gbm_shp = pd.merge(CAshape, gbm, on = 'COUNTY')

# Do same for technical biomass
tbm_shp = pd.merge(CAshape, tbm, on = 'COUNTY')


# In[34]:

type(tbm_shp)
tbm_shp.tail()


gbm_shp[gbm_shp['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()


# In[25]:

# # play around with plotting ??? COME BACK TO
# gbm['disposal.yields']

# # set a variable that will call whatever column we want to visualise on the map
# variable = "disposal.yields"
# # set the range for the choropleth
# vmin, vmax = 100, 2500000
# # create figure and axes for Matplotlib
# fig, ax = plt.subplots(1, figsize=(10, 6))


# In[35]:

print("DONE RUNNING -- come back to play with grouping and/or plotting")

