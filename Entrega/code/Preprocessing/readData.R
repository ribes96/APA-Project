#import de todos los datos y ponerlos nombres

library("foreign")
pathAlbert = "/home/hobber/git/APA-Project/dataset/ThoraricSurgery.arff"
pathKerstin = "C:/Users/Kerstin/Documents/Studium/Inhalte/05_APA_Machine Learning (Lluis)/Project/dataset/ThoraricSurgery.arff"
if (Sys.info()[6] == "hobber") {
  genPath = pathAlbert
 } else {
  genPath = pathKerstin }

#########################
## MODIFY THIS
#########################
genPath = "/home/hobber/git/APA-Project/dataset/ThoraricSurgery.arff"

########################
## DON'T MODIFY FROM HERE
#########################

thoraric = read.arff(genPath)
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


