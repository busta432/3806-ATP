%------------------------------------------------------------------------------
% File     : LB363+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 13
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( gamma(obj12) | zeta(obj12) )).
fof(p2, axiom, ( ~gamma(obj12) )).
fof(p3, axiom, ( ! [X] : ((zeta(X) => kappa(X))) )).
fof(goal, conjecture, ( kappa(obj12) )).
%------------------------------------------------------------------------------
