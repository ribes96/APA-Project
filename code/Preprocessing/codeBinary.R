#Change binary variables into one combined variable

#bin2 = model.matrix(~ factor(thoraric$PAIN))
#bin3 = model.matrix(~ factor(thoraric$HAEMOPTYSIS))
#bin4 = model.matrix(~ factor(thoraric$DISPNOEA))
#bin5 = model.matrix(~ factor(thoraric$COUGH))
#bin6 = model.matrix(~ factor(thoraric$WEAKNESS))
#bin8 = model.matrix(~ factor(thoraric$DIABETES))
#bin9 = model.matrix(~ factor(thoraric$MI))
#bin10 = model.matrix(~ factor(thoraric$PAD))
#bin11 = model.matrix(~ factor(thoraric$SMOKE))
#bin12 = model.matrix(~ factor(thoraric$ASTHMA))
#bin13 = model.matrix(~ factor(thoraric$DIED))


bin1 = model.matrix(~ factor(thoraric$DGN)+0)
colnames(bin1) = c("DGN.1","DGN.2","DGN.3","DGN.4","DGN.5","DGN.6","DGN.8")
thoraric = thoraric[-1]
thoraric = cbind(thoraric, bin1)