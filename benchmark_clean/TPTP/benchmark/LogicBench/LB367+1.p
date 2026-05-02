%------------------------------------------------------------------------------
% File     : LB367+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 17
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( eta(obj16) | kappa(obj16) )).
fof(p2, axiom, ( ~eta(obj16) )).
fof(p3, axiom, ( ! [X] : ((kappa(X) => omega(X))) )).
fof(goal, conjecture, ( omega(obj16) )).
%------------------------------------------------------------------------------
