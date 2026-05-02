%------------------------------------------------------------------------------
% File     : LB_CD_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 4
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => q1_3(X))) )).
fof(p2, axiom, ( ! [X] : ((iota(X) => q2_3(X))) )).
fof(p3, axiom, ( delta(c3) | iota(c3) )).
fof(goal, conjecture, ( q1_3(c3) | q2_3(c3) )).
%------------------------------------------------------------------------------
