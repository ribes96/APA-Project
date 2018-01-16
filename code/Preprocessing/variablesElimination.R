#eliminar los variables explicadas en la documentaci�n

keep = c(
"FVC",
"FEV1",
"PERFORMANCE",
"PAIN",
"HAEMOPTYSIS",
"DISPNOEA",
"COUGH",
"WEAKNESS",
"SIZE",
"DIABETES",
"PAD",
"SMOKE",
"AGE",
"DIED",
"DGN.2",
"DGN.3",
"DGN.4",
"DGN.5",
"DGN.6"
)

thoraric.removed = thoraric[,keep]
thoraric.original = thoraric
