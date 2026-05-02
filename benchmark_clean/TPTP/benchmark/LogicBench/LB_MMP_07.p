%------------------------------------------------------------------------------
% File     : LB_MMP_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 7
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => mid1_6(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_6(X) => mid2_6(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_6(X) => beta(X))) )).
fof(p4, axiom, ( eta(c6) )).
fof(goal, conjecture, ( beta(c6) )).
%------------------------------------------------------------------------------
