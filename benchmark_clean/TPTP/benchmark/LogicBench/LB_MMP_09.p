%------------------------------------------------------------------------------
% File     : LB_MMP_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 9
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => mid1_8(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_8(X) => mid2_8(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_8(X) => delta(X))) )).
fof(p4, axiom, ( iota(c8) )).
fof(goal, conjecture, ( delta(c8) )).
%------------------------------------------------------------------------------
