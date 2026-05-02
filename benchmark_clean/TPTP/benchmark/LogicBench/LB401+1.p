%------------------------------------------------------------------------------
% File     : LB401+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 7 cases var 1
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( phi(obj0) | psi(obj0) | chi(obj0) | omega(obj0) | sigma(obj0) | rho(obj0) | tau(obj0) )).
fof(case0, axiom, ( ! [X] : ((phi(X) => gamma(X))) )).
fof(case1, axiom, ( ! [X] : ((psi(X) => gamma(X))) )).
fof(case2, axiom, ( ! [X] : ((chi(X) => gamma(X))) )).
fof(case3, axiom, ( ! [X] : ((omega(X) => gamma(X))) )).
fof(case4, axiom, ( ! [X] : ((sigma(X) => gamma(X))) )).
fof(case5, axiom, ( ! [X] : ((rho(X) => gamma(X))) )).
fof(case6, axiom, ( ! [X] : ((tau(X) => gamma(X))) )).
fof(goal, conjecture, ( gamma(obj0) )).
%------------------------------------------------------------------------------
