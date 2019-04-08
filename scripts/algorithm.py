#the algorithm
import os
os.chdir("/Users/anayahall/projects/grapevine")

import parameters 

# PREPROCESSINGS & Data WRANGLING
## compost facilities
import swis_preprocessing


## biomass inventory (both gross & technical)
import biomass_preprocessing
### RESHAPE FROM LONG TO WIDE?

## rangelands (for now just rl...)
import land

# DISTANCE MATRICIES

## calculate cost distance matricies --> formalize into function!
import distance_mat

# RUN LP ALGORITHM
import LP_test # <- NEED TO MAKE THIS REAL STILL

# VIEW RESULTS???