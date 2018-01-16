source("dataPreprocessing.R")
source("sampling.R")
source("Models/knn.R")
source("Models/glm.R")
source("Models/NB.R")
source("Models/RN.R")
source("Models/rf.R")
source("preparation.R")
source("resultFunctions.R")

set.seed(42)

getSamples(thoraric.original, thoraric.removed)

#Set weight for F2 score
setWeight(2)

#10x10 CV, f2
results = getResults()

#Reference of F1 score with predictions all false
f = allFalse(thoraric.original)
