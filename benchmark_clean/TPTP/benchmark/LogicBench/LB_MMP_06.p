%------------------------------------------------------------------------------
% File     : LB_MMP_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 6
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => mid1_5(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_5(X) => mid2_5(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_5(X) => alpha(X))) )).
fof(p4, axiom, ( zeta(c5) )).
fof(goal, conjecture, ( alpha(c5) )).
%------------------------------------------------------------------------------
