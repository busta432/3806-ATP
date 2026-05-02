%------------------------------------------------------------------------------
% File     : LB374+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 24
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( omega(obj3) | tau(obj3) )).
fof(p2, axiom, ( ~omega(obj3) )).
fof(p3, axiom, ( ! [X] : ((tau(X) => alpha(X))) )).
fof(goal, conjecture, ( alpha(obj3) )).
%------------------------------------------------------------------------------
