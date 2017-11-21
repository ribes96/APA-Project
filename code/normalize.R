
FEV1.max = max(thoraric$FEV1)
FEV1.min = min(thoraric$FEV1)

FVC.max = max(thoraric$FVC)
FVC.min = min(thoraric$FVC)

thoraric$FVC = (thoraric$FVC - FVC.min)/(FVC.max - FVC.min)
thoraric$FEV1 = (thoraric$FEV1 - FEV1.min)/(FEV1.max - FEV1.min)