\* Compost Distribution Problem *\
Maximize
Sum_of_Transporting_Costs: 61285.9269356 Route_Imperial_13_AA_0095
 + 774663.765766 Route_Imperial_19_AA_1060
 + 734022.973865 Route_Imperial_19_AR_5584
 + 555753.948348 Route_Imperial_30_AB_0378
 + 382332.933263 Route_Imperial_37_AB_0011
 + 809713.405343 Route_Los_Angeles_13_AA_0095
 + 66508.4231411 Route_Los_Angeles_19_AA_1060
 + 70214.024712 Route_Los_Angeles_19_AR_5584
 + 249245.727376 Route_Los_Angeles_30_AB_0378
 + 484952.287482 Route_Los_Angeles_37_AB_0011
 + 595801.832635 Route_Orange_13_AA_0095
 + 242016.96541 Route_Orange_19_AA_1060
 + 189817.025812 Route_Orange_19_AR_5584
 + 36498.5855999 Route_Orange_30_AB_0378
 + 245672.593896 Route_Orange_37_AB_0011
 + 428140.350776 Route_San_Diego_13_AA_0095
 + 460512.854002 Route_San_Diego_19_AA_1060
 + 409713.506054 Route_San_Diego_19_AR_5584
 + 218940.005264 Route_San_Diego_30_AB_0378
 + 24701.0922261 Route_San_Diego_37_AB_0011
Subject To
Sum_of_compost_into_Facilities_13_AA_0095: Route_Imperial_13_AA_0095
 + Route_Los_Angeles_13_AA_0095 + Route_Orange_13_AA_0095
 + Route_San_Diego_13_AA_0095 <= 54803.3024
Sum_of_compost_into_Facilities_19_AA_1060: Route_Imperial_19_AA_1060
 + Route_Los_Angeles_19_AA_1060 + Route_Orange_19_AA_1060
 + Route_San_Diego_19_AA_1060 <= 9174.66
Sum_of_compost_into_Facilities_19_AR_5584: Route_Imperial_19_AR_5584
 + Route_Los_Angeles_19_AR_5584 + Route_Orange_19_AR_5584
 + Route_San_Diego_19_AR_5584 <= 33823.9132
Sum_of_compost_into_Facilities_30_AB_0378: Route_Imperial_30_AB_0378
 + Route_Los_Angeles_30_AB_0378 + Route_Orange_30_AB_0378
 + Route_San_Diego_30_AB_0378 <= 7645.55
Sum_of_compost_into_Facilities_37_AB_0011: Route_Imperial_37_AB_0011
 + Route_Los_Angeles_37_AB_0011 + Route_Orange_37_AB_0011
 + Route_San_Diego_37_AB_0011 <= 7645.55
Sum_of_waste_out_of_Counties_Imperial: Route_Imperial_13_AA_0095
 + Route_Imperial_19_AA_1060 + Route_Imperial_19_AR_5584
 + Route_Imperial_30_AB_0378 + Route_Imperial_37_AB_0011 <= 6751.16711032
Sum_of_waste_out_of_Counties_Los_Angeles: Route_Los_Angeles_13_AA_0095
 + Route_Los_Angeles_19_AA_1060 + Route_Los_Angeles_19_AR_5584
 + Route_Los_Angeles_30_AB_0378 + Route_Los_Angeles_37_AB_0011
 <= 307295.084576
Sum_of_waste_out_of_Counties_Orange: Route_Orange_13_AA_0095
 + Route_Orange_19_AA_1060 + Route_Orange_19_AR_5584 + Route_Orange_30_AB_0378
 + Route_Orange_37_AB_0011 <= 104525.75586
Sum_of_waste_out_of_Counties_San_Diego: Route_San_Diego_13_AA_0095
 + Route_San_Diego_19_AA_1060 + Route_San_Diego_19_AR_5584
 + Route_San_Diego_30_AB_0378 + Route_San_Diego_37_AB_0011 <= 113139.598593
Bounds
0 <= Route_Imperial_13_AA_0095
0 <= Route_Imperial_19_AA_1060
0 <= Route_Imperial_19_AR_5584
0 <= Route_Imperial_30_AB_0378
0 <= Route_Imperial_37_AB_0011
0 <= Route_Los_Angeles_13_AA_0095
0 <= Route_Los_Angeles_19_AA_1060
0 <= Route_Los_Angeles_19_AR_5584
0 <= Route_Los_Angeles_30_AB_0378
0 <= Route_Los_Angeles_37_AB_0011
0 <= Route_Orange_13_AA_0095
0 <= Route_Orange_19_AA_1060
0 <= Route_Orange_19_AR_5584
0 <= Route_Orange_30_AB_0378
0 <= Route_Orange_37_AB_0011
0 <= Route_San_Diego_13_AA_0095
0 <= Route_San_Diego_19_AA_1060
0 <= Route_San_Diego_19_AR_5584
0 <= Route_San_Diego_30_AB_0378
0 <= Route_San_Diego_37_AB_0011
Generals
Route_Imperial_13_AA_0095
Route_Imperial_19_AA_1060
Route_Imperial_19_AR_5584
Route_Imperial_30_AB_0378
Route_Imperial_37_AB_0011
Route_Los_Angeles_13_AA_0095
Route_Los_Angeles_19_AA_1060
Route_Los_Angeles_19_AR_5584
Route_Los_Angeles_30_AB_0378
Route_Los_Angeles_37_AB_0011
Route_Orange_13_AA_0095
Route_Orange_19_AA_1060
Route_Orange_19_AR_5584
Route_Orange_30_AB_0378
Route_Orange_37_AB_0011
Route_San_Diego_13_AA_0095
Route_San_Diego_19_AA_1060
Route_San_Diego_19_AR_5584
Route_San_Diego_30_AB_0378
Route_San_Diego_37_AB_0011
End
