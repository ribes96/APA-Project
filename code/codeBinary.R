#Change binary variables into one combined variable

bin1 = model.matrix(~ factor(thoraric$DGN))
bin2 = model.matrix(~ factor(thoraric$PAIN))
bin3 = model.matrix(~ factor(thoraric$HAEMOPTYSIS))
bin4 = model.matrix(~ factor(thoraric$DISPNOEA))
bin5 = model.matrix(~ factor(thoraric$COUGH))
bin6 = model.matrix(~ factor(thoraric$WEAKNESS))
bin7 = model.matrix(~ factor(thoraric$SIZE))
bin8 = model.matrix(~ factor(thoraric$DIABETES))
bin9 = model.matrix(~ factor(thoraric$MI))
bin10 = model.matrix(~ factor(thoraric$PAD))
bin11 = model.matrix(~ factor(thoraric$SMOKE))
bin12 = model.matrix(~ factor(thoraric$ASTHMA))
bin13 = model.matrix(~ factor(thoraric$DIED))

#Turn a column into binary
bin = function(c) model.matrix(~ factor(c))
