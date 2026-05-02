%------------------------------------------------------------------------------
% File     : LB403+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 7 cases var 3
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( sigma(obj2) | rho(obj2) | tau(obj2) | nu(obj2) | mu(obj2) | xi(obj2) | alpha(obj2) )).
fof(case0, axiom, ( ! [X] : ((sigma(X) => eta(X))) )).
fof(case1, axiom, ( ! [X] : ((rho(X) => eta(X))) )).
fof(case2, axiom, ( ! [X] : ((tau(X) => eta(X))) )).
fof(case3, axiom, ( ! [X] : ((nu(X) => eta(X))) )).
fof(case4, axiom, ( ! [X] : ((mu(X) => eta(X))) )).
fof(case5, axiom, ( ! [X] : ((xi(X) => eta(X))) )).
fof(case6, axiom, ( ! [X] : ((alpha(X) => eta(X))) )).
fof(goal, conjecture, ( eta(obj2) )).
%------------------------------------------------------------------------------
