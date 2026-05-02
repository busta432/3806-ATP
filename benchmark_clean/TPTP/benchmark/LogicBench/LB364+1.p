%------------------------------------------------------------------------------
% File     : LB364+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 14
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( delta(obj13) | eta(obj13) )).
fof(p2, axiom, ( ~delta(obj13) )).
fof(p3, axiom, ( ! [X] : ((eta(X) => phi(X))) )).
fof(goal, conjecture, ( phi(obj13) )).
%------------------------------------------------------------------------------
