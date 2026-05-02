%------------------------------------------------------------------------------
% File     : LB_MMP_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 4
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => mid1_3(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_3(X) => mid2_3(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_3(X) => iota(X))) )).
fof(p4, axiom, ( delta(c3) )).
fof(goal, conjecture, ( iota(c3) )).
%------------------------------------------------------------------------------
