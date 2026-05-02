%------------------------------------------------------------------------------
% File     : LB369+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 19
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(obj18) | psi(obj18) )).
fof(p2, axiom, ( ~iota(obj18) )).
fof(p3, axiom, ( ! [X] : ((psi(X) => rho(X))) )).
fof(goal, conjecture, ( rho(obj18) )).
%------------------------------------------------------------------------------
