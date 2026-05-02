%------------------------------------------------------------------------------
% File     : LB_CD_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 6
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => q1_5(X))) )).
fof(p2, axiom, ( ! [X] : ((alpha(X) => q2_5(X))) )).
fof(p3, axiom, ( zeta(c5) | alpha(c5) )).
fof(goal, conjecture, ( q1_5(c5) | q2_5(c5) )).
%------------------------------------------------------------------------------
