%------------------------------------------------------------------------------
% File     : LB_CD_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 10
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => q1_9(X))) )).
fof(p2, axiom, ( ! [X] : ((epsilon(X) => q2_9(X))) )).
fof(p3, axiom, ( kappa(c9) | epsilon(c9) )).
fof(goal, conjecture, ( q1_9(c9) | q2_9(c9) )).
%------------------------------------------------------------------------------
