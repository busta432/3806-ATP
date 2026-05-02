%------------------------------------------------------------------------------
% File     : LB361+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 11
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( alpha(obj10) | delta(obj10) )).
fof(p2, axiom, ( ~alpha(obj10) )).
fof(p3, axiom, ( ! [X] : ((delta(X) => theta(X))) )).
fof(goal, conjecture, ( theta(obj10) )).
%------------------------------------------------------------------------------
