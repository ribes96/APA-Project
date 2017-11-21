keep = c(
"FVC"  ,       "FEV1"       , "PERFORMANCE" ,"PAIN"      ,  "HAEMOPTYSIS",
"DISPNOEA",    "COUGH"     ,  "WEAKNESS"  ,  "SIZE"     ,   "DIABETES"   ,
    "PAD"     ,    "SMOKE" ,     "AGE"        ,
"DIED"    ,     "DGN.2"      , "DGN.3" ,      "DGN.4"      ,
"DGN.5"    ,   "DGN.6"
)

thoraric = thoraric[,keep]

thoraric = thoraric[thoraric$FEV1 <= thoraric$FVC,]

