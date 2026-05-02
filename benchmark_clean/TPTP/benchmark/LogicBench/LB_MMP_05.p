%------------------------------------------------------------------------------
% File     : LB_MMP_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 5
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => mid1_4(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_4(X) => mid2_4(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_4(X) => kappa(X))) )).
fof(p4, axiom, ( epsilon(c4) )).
fof(goal, conjecture, ( kappa(c4) )).
%------------------------------------------------------------------------------
