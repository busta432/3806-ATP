%------------------------------------------------------------------------------
% File     : LB_CD_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 9
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => q1_8(X))) )).
fof(p2, axiom, ( ! [X] : ((delta(X) => q2_8(X))) )).
fof(p3, axiom, ( iota(c8) | delta(c8) )).
fof(goal, conjecture, ( q1_8(c8) | q2_8(c8) )).
%------------------------------------------------------------------------------
