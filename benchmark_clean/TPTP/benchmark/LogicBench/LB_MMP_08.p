%------------------------------------------------------------------------------
% File     : LB_MMP_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 8
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) => mid1_7(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_7(X) => mid2_7(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_7(X) => gamma(X))) )).
fof(p4, axiom, ( theta(c7) )).
fof(goal, conjecture, ( gamma(c7) )).
%------------------------------------------------------------------------------
