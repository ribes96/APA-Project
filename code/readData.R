library("foreign")
setwd("../dataset")
thoraric = read.arff("ThoraricSurgery.arff")
mammo.names = c("bi-rads", "age", "shape", "margin", "density", "severity")
mammo = read.csv("mammographic_masses.data", header = F, col.names = mammo.names)
names(thoraric) = c(
  "DGN",
  "FVC", #Forced Vital Capacity
  "FEV1",
  "PERFORMANCE",
  "PAIN",
  "HAEMOPTYSIS",
  "DISPNOEA",
  "COUGH",
  "WEAKNESS",
  "SIZE",
  "DIABETES",
  "MI",
  "PAD",
  "SMOKE",
  "ASTHMA",
  "AGE",
  "SURVIVED"
  )
