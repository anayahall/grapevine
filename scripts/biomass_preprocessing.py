
# coding: utf-8

# In[3]:

# Script to clean pre-process BIOMASS INVENTORY and make spatial

# First, load packages
import pandas as pd
import os
import numpy as np
import shapely as sp

import matplotlib.pyplot as plt
import geopandas as gpd
from geopandas import GeoSeries, GeoDataFrame
# only for jupyter nb to show plots inline
#%matplotlib inline 


# In[10]:

#check wd
#print(os.getcwd())

#change wd
os.chdir("/Users/anayahall/projects/grapevine")

#read in biomass inventory
# GROSS inventory
gbm = pd.read_csv("data/raw/biomass.inventory.csv")

# TECHNICAL inventory
tbm = pd.read_csv("data/raw/biomass.inventory.technical.csv")


# In[50]:

gbm.head()
tbm.head()

gbm.columns

# check that all counties in there
len(gbm.COUNTY.unique())
#yup, plus one "other"


# In[13]:

gbm['biomass.category'].value_counts()
# same as technical


# In[26]:

gbm['biomass.feedstock'].value_counts().head()
# same as technical
# tbm['biomass.feedstock'].value_counts().head()


# In[27]:

gbm[gbm['disposal.yields'] == gbm['disposal.yields'].max()]


# In[63]:

#look at just manure (if feedstock, needs to be capitalized), if category, lower case -- should be equivalent!
gbm[(gbm['biomass.feedstock'] == "MANURE") & (gbm['year'] == 2014)].head()


# In[56]:

#start grouping by: biomass category

gbm.groupby(['biomass.category'])['disposal.yields'].sum()


# In[64]:

gbm[gbm['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()


# In[ ]:



