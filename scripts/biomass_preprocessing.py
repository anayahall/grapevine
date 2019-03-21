
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
import geopandas
from geopandas import GeoSeries, GeoDataFrame

import plotly.plotly as py

# only for jupyter nb to show plots inline
# get_ipython().magic('matplotlib inline')

print("BIOMASS PREPROCESSING")


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

UScounties = fiona.open("data/raw/tl_2018_06_tract/tl_2018_06_tract.shp")


# In[ ]:




# In[11]:

print("DONE RUNNING")

