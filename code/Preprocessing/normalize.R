
margin = 0.1

FEV1.max = (1 + margin) * max(thoraric$FEV1)
FEV1.min = (1 - margin) * min(thoraric$FEV1)

FVC.max = (1 + margin) * max(thoraric$FVC)
FVC.min = (1 - margin) * min(thoraric$FVC)

AGE.max = 100
AGE.min = 0

PERFORMANCE.max = max(thoraric$PERFORMANCE)
PERFORMANCE.min = min(thoraric$PERFORMANCE)

thoraric$FVC = (thoraric$FVC - FVC.min)/(FVC.max - FVC.min)
thoraric$FEV1 = (thoraric$FEV1 - FEV1.min)/(FEV1.max - FEV1.min)

thoraric$AGE = (thoraric$AGE - AGE.min)/(AGE.max - AGE.min)

thoraric$PERFORMANCE = (thoraric$PERFORMANCE - PERFORMANCE.min)/(PERFORMANCE.max - PERFORMANCE.min)

#TODO queda normalizar AGE, y quizá SIZE y PERFORMANCE