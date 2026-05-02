%------------------------------------------------------------------------------
% File     : LB_MMP_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 10
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => mid1_9(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_9(X) => mid2_9(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_9(X) => epsilon(X))) )).
fof(p4, axiom, ( kappa(c9) )).
fof(goal, conjecture, ( epsilon(c9) )).
%------------------------------------------------------------------------------
