%------------------------------------------------------------------------------
% File     : LB_CD_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 8
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) => q1_7(X))) )).
fof(p2, axiom, ( ! [X] : ((gamma(X) => q2_7(X))) )).
fof(p3, axiom, ( theta(c7) | gamma(c7) )).
fof(goal, conjecture, ( q1_7(c7) | q2_7(c7) )).
%------------------------------------------------------------------------------
