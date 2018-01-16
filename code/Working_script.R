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
setWeight(2)
getResults()

#10x10 CV, f2
resultados1 = getResults()
