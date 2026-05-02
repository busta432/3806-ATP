%------------------------------------------------------------------------------
% File     : LB_MMP_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 1
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => mid1_0(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_0(X) => mid2_0(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_0(X) => zeta(X))) )).
fof(p4, axiom, ( alpha(c0) )).
fof(goal, conjecture, ( zeta(c0) )).
%------------------------------------------------------------------------------
