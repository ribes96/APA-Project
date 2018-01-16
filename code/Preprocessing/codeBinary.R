#Change binary variables into one combined variable

bin1 = model.matrix(~ factor(thoraric$DGN)+0)
colnames(bin1) = c("DGN.1","DGN.2","DGN.3","DGN.4","DGN.5","DGN.6","DGN.8")
thoraric = thoraric[-1]
thoraric = cbind(thoraric, bin1)