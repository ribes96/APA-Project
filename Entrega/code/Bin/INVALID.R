#Data without DGN1 & DGN8
data.noDGN = subset(thoraric, thoraric$DGN != "DGN1" & thoraric$DGN != "DGN8" )
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
  "COUGH","WEAKNESS","SIZE","DIABETES","MI","PAD","SMOKE","ASTHMA","AGE","DIED")

#Data without MI
data.noMI = subset(thoraric[-12], thoraric$MI != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","PAD","SMOKE","ASTHMA","AGE","DIED")

#Data without PAD
data.noPAD = subset(thoraric[-13], thoraric$PAD != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","MI","SMOKE","ASTHMA","AGE","DIED")

#Data without ASTHMA
data.noASTHMA = subset(thoraric[-15], thoraric$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","MI","PAD","SMOKE","AGE","DIED")

#Data without DGN1/DGN8 & MI
data.noDGN_MI = subset(data.noDGN[-12], data.noDGN$MI != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","PAD","SMOKE","ASTHMA","AGE","DIED")

#Data without DGN1/DGN8 & PAD
data.noDGN_PAD = subset(data.noDGN[-13], data.noDGN$PAD != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","MI","SMOKE","ASTHMA","AGE","DIED")

#Data without DGN1/DGN8 & ASTHMA
data.noDGN_ASTHMA = subset(data.noDGN[-15], data.noDGN$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","MI","PAD","SMOKE","AGE","DIED")

#Data without DGN1/DGN8 & MI & PAD
data.noDGN_MI_PAD = subset(data.noDGN_MI[-12], data.noDGN_MI$PAD != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","SMOKE","ASTHMA","AGE","DIED")

#Data without DGN1/DGN8 & MI & ASTHMA
data.noDGN_MI_ASTHMA = subset(data.noDGN_MI[-14], data.noDGN_MI$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","PAD","SMOKE","AGE","DIED")

#Data without DGN1/DGN8 & PAD & ASTHMA
data.noDGN_PAD_ASTHMA = subset(data.noDGN_PAD[-14], data.noDGN_PAD$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","MI","SMOKE","AGE","DIED")

#Data without DGN1/DGN8 & MI & PAD & ASTHMA
data.noDGN_MI_PAD_ASTHMA = subset(data.noDGN_MI_PAD[-13], data.noDGN_MI_PAD$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","SMOKE","AGE","DIED")

#Data without MI & PAD
data.noMI_PAD = subset(data.noMI[-12], data.noMI$PAD != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","SMOKE","ASTHMA","AGE","DIED")

#Data without MI & ASTHMA
data.noMI_ASTHMA = subset(data.noMI[-14], data.noMI$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","PAD","SMOKE","AGE","DIED")

#Data without MI & PAD & ASTHMA
data.noMI_PAD_ASTHMA = subset(data.noMI_PAD[-13], data.noMI_PAD$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","SMOKE","AGE","DIED")

#Data without PAD & ASTHMA
data.noPAD_ASTHMA = subset(data.noPAD[-14], data.noPAD$ASTHMA != TRUE)
names(data.noDGN) = c("DGN","FVC","FEV1","PERFORMANCE","PAIN","HAEMOPTYSIS","DISPNOEA",
                      "COUGH","WEAKNESS","SIZE","DIABETES","MI","SMOKE","AGE","DIED")


