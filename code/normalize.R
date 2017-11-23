
margin = 0.2

FEV1.max = (1 + margin) * max(thoraric$FEV1)
FEV1.min = (1 - margin) * min(thoraric$FEV1)

FVC.max = (1 + margin) * max(thoraric$FVC)
FVC.min = (1 - margin) * min(thoraric$FVC)

thoraric$FVC = (thoraric$FVC - FVC.min)/(FVC.max - FVC.min)
thoraric$FEV1 = (thoraric$FEV1 - FEV1.min)/(FEV1.max - FEV1.min)

#TODO queda normalizar AGE, y quizá SIZE y PERFORMANCE