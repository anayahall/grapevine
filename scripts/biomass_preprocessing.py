# Script to clean pre-process BIOMASS INVENTORY and make spatial

####################################################################
# First, load packages
import pandas as pd
import os
import geopandas as gpd
from fxns import epsg_meters

def MergeInventoryAndCounty(gross_inventory, technical_inventory, county_shapefile, fips_data):
    """
        gross_inventory      - TODO
        technical_inventory  - TODO
        county_shapefile     - TODO

        Returns:
    """

    ##################################################################
    #read in biomass inventory
    # GROSS inventory
    gbm = pd.read_csv(gross_inventory)

    # TECHNICAL inventory
    tbm = pd.read_csv(technical_inventory)

    # check that all counties in there
    assert len(gbm.COUNTY.unique())==59
    #yup, plus one "other"

    gbm[gbm['disposal.yields'] == gbm['disposal.yields'].max()]

    #look at just manure (if feedstock, needs to be capitalized), if category, lower case -- should be equivalent!
    gbm[(gbm['biomass.feedstock'] == "MANURE") & (gbm['year'] == 2014)].head()

    #start grouping by: biomass category
    gbm.groupby(['biomass.category'])['disposal.yields'].sum()
    gbm[gbm['biomass.category'] == "manure"].groupby(['COUNTY'])['disposal.yields'].sum().head()

    # now load SHAPEFILE for all CA COUNTIES to merge this
    print("p Read in CA COUNTIES shapefile and reproject")
    CA = gpd.read_file(county_shapefile)
    CA.head()

    # Create new geoseries of county centroids - 
    # note, technically still a panda series until 'set_geomtry()' is called
    CA['cocent'] = CA['geometry'].centroid
    CA.tail()


    # both set geometry (see above) and plot to check it looks right
    CA.set_geometry('cocent').plot()


    # CREATE FIPS ID to merge with county names
    CA['FIPS']=CA['STATEFP'].astype(str)+CA['COUNTYFP']

    # get rid of leading zero
    CA.FIPS = [s.lstrip("0") for s in CA.FIPS]

    #convert to integer for merging below
    CA.FIPS = [int(i) for i in CA.FIPS]
    #print(CA.head())


    # NEED TO BRING IN COUNTY NAMES TO MERGE WITH BIOMASS DATA
    countyIDs = pd.read_csv(fips_data, names = ["FIPS", "COUNTY", "State"])
    #print(countyIDs)

    #print(type(countyIDs.FIPS[0]))
    #print(type(CA.FIPS[0]))

    CAshape = pd.merge(CA, countyIDs, on = 'FIPS')

    CAshape.head()

    # Create subset of just county centroid points NOT POLYGONS
    CAshape.head()

    CA_pts = CAshape.set_geometry('cocent')[['cocent','FIPS', 'COUNTY', 'ALAND', 'AWATER']]

    # now can merge with biomass data finally!!!
    #print(gbm.columns)
    print("merging biomass data with CA shapefile")

    #POLYGONS
    # gbm_shp = pd.merge(CAshape, gbm, on = 'COUNTY')
    # # Do same for technical biomass
    # tbm_shp = pd.merge(CAshape, tbm, on = 'COUNTY')

    # TODO - turn into wet tons
    # fw_mc = 0.7
    # gw_mc = 0.5

    # fw = ofmsw[ofmsw['Feedstock'] == "FOOD"]
    # gw = ofmsw[ofmsw['Feedstock'] == "GREEN"]

    # fw['WetTons'] = fw['BDTons'] * (1 + fw_mc)
    # gw['WetTons'] = gw['BDTons'] * (1 + gw_mc)


    # TODO - turn into m3


    # COUNTY CENTROIDS
    gbm_pts = pd.merge(CA_pts, gbm, on = 'COUNTY')
    tbm_pts = pd.merge(CA_pts, tbm, on = 'COUNTY')

    print("p BIOMASS PRE_PROCESSING DONE RUNNING")

    return gbm_pts, tbm_pts
