\* Compost Distribution Problem *\
Maximize
Sum_of_Transporting_Costs: 11446.4575881 Route_Imperial_13_AA_0095
 + 433712.423352 Route_Imperial_19_AA_1060
 + 413320.998009 Route_Imperial_19_AR_5584
 + 320013.505725 Route_Imperial_30_AB_0378
 + 239493.188921 Route_Imperial_37_AB_0011
 + 416759.29953 Route_Los_Angeles_13_AA_0095
 + 19159.063231 Route_Los_Angeles_19_AA_1060
 + 12276.2352448 Route_Los_Angeles_19_AR_5584
 + 115258.010758 Route_Los_Angeles_30_AB_0378
 + 250260.751342 Route_Los_Angeles_37_AB_0011
 + 327670.183997 Route_Orange_13_AA_0095
 + 121357.712814 Route_Orange_19_AA_1060
 + 93844.2342667 Route_Orange_19_AR_5584
 + 13140.2559725 Route_Orange_30_AB_0378
 + 148381.513338 Route_Orange_37_AB_0011
 + 178729.01028 Route_San_Diego_13_AA_0095
 + 284186.248364 Route_San_Diego_19_AA_1060
 + 258337.335177 Route_San_Diego_19_AR_5584
 + 153297.569102 Route_San_Diego_30_AB_0378
 + 59649.136734 Route_San_Diego_37_AB_0011
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
