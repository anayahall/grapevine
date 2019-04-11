# Script to clean pre-process BIOMASS INVENTORY and make spatial

####################################################################
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
# GROSS inventory
gbm = pd.read_csv("data/raw/biomass.inventory.csv")

# TECHNICAL inventory
tbm = pd.read_csv("data/raw/biomass.inventory.technical.csv")

# check that all counties in there
len(gbm.COUNTY.unique())
#yup, plus one "other"


# EXPLORE DATA
# gbm['biomass.category'].value_counts()
# same as technical

# gbm['biomass.feedstock'].value_counts().head()
# same as technical
# tbm['biomass.feedstock'].value_counts().head()

gbm[gbm['disposal.yields'] == gbm['disposal.yields'].max()]



#look at just manure (if feedstock, needs to be capitalized), if category, lower case -- should be equivalent!
gbm[(gbm['biomass.feedstock'] == "MANURE") & (gbm['year'] == 2014)].head()



#start grouping by: biomass category
gbm.groupby(['biomass.category'])['disposal.yields'].sum()
gbm[gbm['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()




# now load SHAPEFILE for all CA COUNTIES to merge this
print("read in CA COUNTIES shapefile and reproject")
CA_proj = gpd.read_file("data/raw/CA_Counties/CA_Counties_TIGER2016.shp")
CA_proj.head()

CA = epsg_meters(CA_proj)

# Create new geoseries of county centroids - 
# note, technically still a panda series until 'set_geomtry()' is called
CA['cocent'] = CA['geometry'].centroid
CA.tail()


# both set geometry (see above) and plot to check it looks right
CA.set_geometry('cocent').plot()


# CREATE FIPS ID to merge with county names
#CAshape.FIPS = str(CAshape.STATEFP) + str(CAshape.COUNTYFP)
CA['FIPS']=CA['STATEFP'].astype(str)+CA['COUNTYFP']

# get rid of leading zero
CA.FIPS = [s.lstrip("0") for s in CA.FIPS]

#convert to integer for merging below
CA.FIPS = [int(i) for i in CA.FIPS]
CA.head()


# NEED TO BRING IN COUNTY NAMES TO MERGE WITH BIOMASS DATA
countyIDs = pd.read_csv("data/interim/CA_FIPS.csv", names = ["FIPS", "COUNTY", "State"])
countyIDs

type(countyIDs.FIPS[0])
type(CA.FIPS[0])

CAshape = pd.merge(CA, countyIDs, on = 'FIPS')

CAshape.head()

# Create subset of just county centroid points NOT POLYGONS
CAshape.head()

CA_pts = CAshape.set_geometry('cocent')[['cocent','FIPS', 'COUNTY', 'ALAND', 'AWATER']]


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



start = time.time()

# print("starting export")

gbm_out = r"/Users/anayahall/projects/grapevine/data/clean/grossbiomass_pts.shp"
tbm_out = r"/Users/anayahall/projects/grapevine/data/clean/techbiomass_pts.shp"

print("saving inventories as shapefile with county centroid pts")
gbm_pts.to_file(driver='ESRI Shapefile', filename=gbm_out)
tbm_pts.to_file(driver='ESRI Shapefile', filename=tbm_out)

end = time.time()
print(end - start)



print("BIOMASS PRE_PROCESSING DONE RUNNING")

