%------------------------------------------------------------------------------
% File     : LB_CD_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => q1_2(X))) )).
fof(p2, axiom, ( ! [X] : ((theta(X) => q2_2(X))) )).
fof(p3, axiom, ( gamma(c2) | theta(c2) )).
fof(goal, conjecture, ( q1_2(c2) | q2_2(c2) )).
%------------------------------------------------------------------------------
