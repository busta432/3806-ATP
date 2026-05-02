%------------------------------------------------------------------------------
% File     : LB392+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 5 cases var 2
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( chi(obj1) | omega(obj1) | sigma(obj1) | rho(obj1) | tau(obj1) )).
fof(case0, axiom, ( ! [X] : ((chi(X) => gamma(X))) )).
fof(case1, axiom, ( ! [X] : ((omega(X) => gamma(X))) )).
fof(case2, axiom, ( ! [X] : ((sigma(X) => gamma(X))) )).
fof(case3, axiom, ( ! [X] : ((rho(X) => gamma(X))) )).
fof(case4, axiom, ( ! [X] : ((tau(X) => gamma(X))) )).
fof(goal, conjecture, ( gamma(obj1) )).
%------------------------------------------------------------------------------
