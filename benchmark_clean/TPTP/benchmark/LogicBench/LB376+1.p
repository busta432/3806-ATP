%------------------------------------------------------------------------------
% File     : LB376+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 26
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( rho(obj5) | mu(obj5) )).
fof(p2, axiom, ( ~rho(obj5) )).
fof(p3, axiom, ( ! [X] : ((mu(X) => gamma(X))) )).
fof(goal, conjecture, ( gamma(obj5) )).
%------------------------------------------------------------------------------
