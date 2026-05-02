%------------------------------------------------------------------------------
% File     : LB_CD_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 1
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => q1_0(X))) )).
fof(p2, axiom, ( ! [X] : ((zeta(X) => q2_0(X))) )).
fof(p3, axiom, ( alpha(c0) | zeta(c0) )).
fof(goal, conjecture, ( q1_0(c0) | q2_0(c0) )).
%------------------------------------------------------------------------------
