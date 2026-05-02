%------------------------------------------------------------------------------
% File     : LB_CD_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 2
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => q1_1(X))) )).
fof(p2, axiom, ( ! [X] : ((eta(X) => q2_1(X))) )).
fof(p3, axiom, ( beta(c1) | eta(c1) )).
fof(goal, conjecture, ( q1_1(c1) | q2_1(c1) )).
%------------------------------------------------------------------------------
