
# coding: utf-8

# In[195]:

# Script to clean capacity values of SWIS compost sites and make spatial

# First, load packages
import pandas as pd
import os
import numpy as np
import shapely as sp
from shapely.geometry import Point

import matplotlib.pyplot as plt
import geopandas as gpd
from geopandas import GeoSeries, GeoDataFrame

# only for jupyter nb to show plots inline
#%matplotlib inline 


# In[196]:

#check wd
#print(os.getcwd())

#change wd
os.chdir("/Users/anayahall/projects/grapevine")

#read in compost facilities csv
df = pd.read_csv("data/interim/swis_compost.csv")


# In[197]:

df.columns
#df.head()
#df.tail()
#df.info()


# In[198]:

df.County.value_counts(dropna=False).head()


# In[199]:

df['CapacityUnits'].value_counts(dropna=False)


# In[200]:

# Identify and recode oddly labeled capacity units (those lacking time unit)
# first: Tons
df[df.CapacityUnits=="Tons"]

n = len(df.index)
for i in range(n):
#     print("index: ", i)
    if df.SwisNo[i] == "13-AA-0095": 
        df.at[i, 'CapacityUnits'] = "Tons/year"
    if df.SwisNo[i]=="49-AA-0422": 
        df.at[i, 'CapacityUnits'] = "Tons/year"
    if df.SwisNo[i]=="36-AA-0456": 
        df.at[i, 'CapacityUnits'] = "Tons/year"
        
# foo = df[df.CapacityUnits=="Tons/Year"]
# print('foo', foo)


# In[201]:

#df[df.CapacityUnits=="Cubic Yards"]


n = len(df.index)
for i in range(n):
    #print("index: ", i)
    if df.SwisNo[i]=="12-AA-0113": 
        df.at[i, 'CapacityUnits']="Cu Yards/month"
    if df.SwisNo[i]=="44-AA-0013": 
        df.at[i, 'CapacityUnits']="Cu Yards/month"
    if df.SwisNo[i]=="28-AA-0037": 
        df.at[i, 'CapacityUnits']="Cu Yards/month"
    if df.SwisNo[i]=="37-AA-0992": 
         df.at[i, 'CapacityUnits']="Cu Yards/year"
    if df.SwisNo[i]=="37-AB-0011": 
         df.at[i, 'CapacityUnits']="Cu Yards/year"
    if df.SwisNo[i]=="43-AA-0015": 
         df.at[i, 'CapacityUnits']="Cu Yards/year"
    if df.SwisNo[i]=="11-AA-0039": 
         df.at[i, 'CapacityUnits']="Cu Yards/year"            
            
        

df[df.CapacityUnits=="Cubic Yards"]


# In[202]:

# first filter out all th
df = df[df['Capacity'].notnull()]

df.reset_index(inplace=True)

df['cap_m3'] = 0.0

# print("df index length: ", len(df.index))

df.tail()


# In[203]:

# write function to convert all capacity units into cubic meters/month!

#how to assign values:
# df.at[i, 'CapacityUnits'] = "Tons/year"

print("CLEANING CAPACITY - CONVERT TO CUBIC METERS / MONTH")
n = len(df.index)
for i in range(n):
    #print("index: ", i)
    if df.CapacityUnits[i] == "Tons/year":
        # print("tons/year")
        # tons/year * cu yards/ton * cu meters/cu yards * years/month 
        #df.cap_m3[i] = df.Capacity[i] * 2.24 * 0.764555 * (1/12)
        df.at[i, 'cap_m3'] = df.Capacity[i] * 2.24 * 0.764555 * (1/12)
        # print(df.cap_m3[i])
    elif df.CapacityUnits[i] == "Cu Yards/year":
        # print("cu yrds/year")
        # cu yards/year * cu meters/cu yards * years/month 
        df.at[i, 'cap_m3'] = df.Capacity[i] * 0.764555 * (1/12)
        # print(df.cap_m3[i])
    elif df.CapacityUnits[i] == "Cubic Yards":
        print("index: ", i ," - cu yrds --- NEED TO DISENTANGLE STILL!")
        # print(df.cap_m3[i])
    elif df.CapacityUnits[i] == "Tons":
        print("tons") #there should be none of these
        # print(df.cap_m3[i])
    elif df.CapacityUnits[i] == "Tons/day":
        # tons/day * cu yards/ton * cu meters/cu yards * days/year * years/month 
        df.at[i, 'cap_m3'] = df.Capacity[i] * 2.24 * 0.764555 * (365/1) * (1/12)
        # print("tons/day")
        # print(df.cap_m3[i])
    elif df.CapacityUnits[i] == "Cu Yards/month":
        # cu yards/month * cu meters/cu yards 
        df.at[i, 'cap_m3'] = df.Capacity[i] * 0.764555
        # print("cu yrds/month")
        # print(df.cap_m3[i])
    elif df.CapacityUnits[i] == "Tires/day":
        print("index: ", i ," - tires/day - delete? now set capacity at: ", df.cap_m3[i])
        df.at[i, 'cap_m3'] = 0.0
    else:
        print("none of the above")

# will also need a function to convert waste volume into compost volume


# In[204]:

# Last thing is to make all points spatial
# try using shapely package
# from shapely.geometry import Point

# point = Point(df.Longitude[0], df.Latitude[0])

# df.points = {}

# n = len(df.index)
# for i in range(n):
#     df.points[i] = Point(df.Longitude[i], df.Latitude[i])


# In[205]:

df.head()


# In[206]:

print("ABOUT to make SPATIAL")

# Use geopandas instead
# from: https://geohackweek.github.io/vector/04-geopandas-intro/
geometry = [Point(xy) for xy in zip(df['Longitude'], df['Latitude'])]
gdf = GeoDataFrame(df, geometry=geometry)

# check length to make sure it matches df
len(geometry)

print("MADE SPATIAL")

# In[207]:

gdf.plot(marker='*', color='green', markersize=50, figsize=(3, 3))


# In[208]:

df.head()


# In[215]:

gdf.crs = {'init' :'epsg:3310'}
# save as??? 

out = r"/Users/anayahall/projects/grapevine/data/clean/clean_swis.shp"

type(gdf)

gdf.to_file(driver='ESRI Shapefile', filename=out)

