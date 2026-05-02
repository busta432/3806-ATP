%------------------------------------------------------------------------------
% File     : LB_CD_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Constructive Dilemma instance 5
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => q1_4(X))) )).
fof(p2, axiom, ( ! [X] : ((kappa(X) => q2_4(X))) )).
fof(p3, axiom, ( epsilon(c4) | kappa(c4) )).
fof(goal, conjecture, ( q1_4(c4) | q2_4(c4) )).
%------------------------------------------------------------------------------
