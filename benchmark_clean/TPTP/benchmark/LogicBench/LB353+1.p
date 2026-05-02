%------------------------------------------------------------------------------
% File     : LB353+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( chi(obj2) | rho(obj2) )).
fof(p2, axiom, ( ~chi(obj2) )).
fof(p3, axiom, ( ! [X] : ((rho(X) => xi(X))) )).
fof(goal, conjecture, ( xi(obj2) )).
%------------------------------------------------------------------------------
