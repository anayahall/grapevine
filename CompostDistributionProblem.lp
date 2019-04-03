\* Compost Distribution Problem *\
Maximize
Sum_of_Transporting_Costs: 20609.9989803 Route_Imperial_13_AA_0095
 + 780276.585978 Route_Imperial_19_AA_1060
 + 743524.25104 Route_Imperial_19_AR_5584
 + 575489.559929 Route_Imperial_30_AB_0378
 + 430473.26782 Route_Imperial_37_AB_0011
 + 749736.862516 Route_Los_Angeles_13_AA_0095
 + 34472.8851429 Route_Los_Angeles_19_AA_1060
 + 22085.7423126 Route_Los_Angeles_19_AR_5584
 + 207405.979811 Route_Los_Angeles_30_AB_0378
 + 450398.101751 Route_Los_Angeles_37_AB_0011
 + 589287.808106 Route_Orange_13_AA_0095
 + 218380.793376 Route_Orange_19_AA_1060
 + 168868.936288 Route_Orange_19_AR_5584
 + 23645.3173082 Route_Orange_30_AB_0378
 + 267076.941807 Route_Orange_37_AB_0011
 + 321270.366374 Route_San_Diego_13_AA_0095
 + 511349.722419 Route_San_Diego_19_AA_1060
 + 464812.396318 Route_San_Diego_19_AR_5584
 + 275763.383817 Route_San_Diego_30_AB_0378
 + 107245.383437 Route_San_Diego_37_AB_0011
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
