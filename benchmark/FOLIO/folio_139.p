fof(premise_0, axiom, (mLAlgorithm(supervisedLearning) | mLAlgorithm(unsupervisedLearning) | mLAlgorithm(reinforcementLearning))).
fof(premise_1, axiom, (~requireLabelledData(unsupervisedLearning))).
fof(premise_2, axiom, (trainTextSumModel(supervisedLearning) | trainTextSumModel(unsupervisedLearning) | trainTextSumModel(reinforcementLearning))).
fof(premise_3, axiom, (~trainTextSumModel(reinforcementLearning))).
fof(premise_4, axiom, (![X] : ((mLAlgorithm(X) & trainTextSumModel(X)) => requireLabelledData(X)))).
fof(conclusion, conjecture, (trainTextSumModel(supervisedLearning))).