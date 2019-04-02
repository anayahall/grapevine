\* Compost Distribution Problem *\
Maximize
Sum_of_Transporting_Costs: 578366.718102 Route_Imperial_13_AA_0095
 + 47506.0165293 Route_Imperial_19_AA_1060
 + 50152.8747943 Route_Imperial_19_AR_5584
 + 178032.662411 Route_Imperial_30_AB_0378
 + 346394.491058 Route_Imperial_37_AB_0011
 + 425572.737597 Route_Los_Angeles_13_AA_0095
 + 172869.261007 Route_Los_Angeles_19_AA_1060
 + 135583.589866 Route_Los_Angeles_19_AR_5584
 + 26070.4182857 Route_Los_Angeles_30_AB_0378
 + 175480.424211 Route_Los_Angeles_37_AB_0011
 + 43775.6620969 Route_Orange_13_AA_0095
 + 553331.261262 Route_Orange_19_AA_1060
 + 524302.124189 Route_Orange_19_AR_5584
 + 396967.105963 Route_Orange_30_AB_0378
 + 273094.952331 Route_Orange_37_AB_0011
 + 305814.536269 Route_San_Diego_13_AA_0095
 + 328937.752858 Route_San_Diego_19_AA_1060
 + 292652.504324 Route_San_Diego_19_AR_5584
 + 156385.718046 Route_San_Diego_30_AB_0378
 + 17643.6373044 Route_San_Diego_37_AB_0011
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
