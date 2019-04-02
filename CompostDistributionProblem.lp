\* Compost Distribution Problem *\
Maximize
Sum_of_Transporting_Costs: 6.07630400463 Route_Imperial_13_AA_0095
 + 0.483657250727 Route_Imperial_19_AA_1060
 + 0.542554148579 Route_Imperial_19_AR_5584
 + 1.81247368868 Route_Imperial_30_AB_0378
 + 3.41042737144 Route_Imperial_37_AB_0011
 + 4.52233440829 Route_Los_Angeles_13_AA_0095
 + 1.63371073483 Route_Los_Angeles_19_AA_1060
 + 1.29038004939 Route_Los_Angeles_19_AR_5584
 + 0.268377197073 Route_Los_Angeles_30_AB_0378
 + 1.71437883974 Route_Los_Angeles_37_AB_0011
 + 0.422079341752 Route_Orange_13_AA_0095
 + 5.69454207081 Route_Orange_19_AA_1060
 + 5.42634937346 Route_Orange_19_AR_5584
 + 4.1554553683 Route_Orange_30_AB_0378
 + 2.91678875133 Route_Orange_37_AB_0011
 + 3.27173689335 Route_San_Diego_13_AA_0095
 + 3.16686907288 Route_San_Diego_19_AA_1060
 + 2.833652217 Route_San_Diego_19_AR_5584
 + 1.4929540687 Route_San_Diego_30_AB_0378
 + 0.164640651782 Route_San_Diego_37_AB_0011
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
