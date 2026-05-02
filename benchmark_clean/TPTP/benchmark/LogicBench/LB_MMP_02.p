%------------------------------------------------------------------------------
% File     : LB_MMP_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 2
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => mid1_1(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_1(X) => mid2_1(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_1(X) => eta(X))) )).
fof(p4, axiom, ( beta(c1) )).
fof(goal, conjecture, ( eta(c1) )).
%------------------------------------------------------------------------------
