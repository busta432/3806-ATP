%------------------------------------------------------------------------------
% File     : LB_CD_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 7
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => q1_6(X))) )).
fof(p2, axiom, ( ! [X] : ((beta(X) => q2_6(X))) )).
fof(p3, axiom, ( eta(c6) | beta(c6) )).
fof(goal, conjecture, ( q1_6(c6) | q2_6(c6) )).
%------------------------------------------------------------------------------
