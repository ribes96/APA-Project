library("foreign")
# Solo para Albert
setwd("/home/hobber/git/APA-Project/dataset")

#setwd("../dataset")
thoraric = read.arff("ThoraricSurgery.arff")
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
  "DIED"
  )
thoraric$PERFORMANCE = as.numeric(thoraric$PERFORMANCE)
thoraric$SIZE = as.numeric(thoraric$SIZE)

thoraric$PAIN = as.logical(thoraric$PAIN)
thoraric$HAEMOPTYSIS = as.logical(thoraric$HAEMOPTYSIS)
thoraric$DISPNOEA = as.logical(thoraric$DISPNOEA)
thoraric$COUGH = as.logical(thoraric$COUGH)
thoraric$WEAKNESS = as.logical(thoraric$WEAKNESS)
thoraric$DIABETES = as.logical(thoraric$DIABETES)
thoraric$MI = as.logical(thoraric$MI)
thoraric$PAD = as.logical(thoraric$PAD)
thoraric$SMOKE = as.logical(thoraric$SMOKE)
thoraric$ASTHMA = as.logical(thoraric$ASTHMA)
thoraric$DIED = as.logical(thoraric$DIED)


