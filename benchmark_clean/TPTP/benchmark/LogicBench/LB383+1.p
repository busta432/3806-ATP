%------------------------------------------------------------------------------
% File     : LB383+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 3 cases var 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( sigma(obj2) | rho(obj2) | tau(obj2) )).
fof(case0, axiom, ( ! [X] : ((sigma(X) => gamma(X))) )).
fof(case1, axiom, ( ! [X] : ((rho(X) => gamma(X))) )).
fof(case2, axiom, ( ! [X] : ((tau(X) => gamma(X))) )).
fof(goal, conjecture, ( gamma(obj2) )).
%------------------------------------------------------------------------------
