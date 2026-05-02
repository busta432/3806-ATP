%------------------------------------------------------------------------------
% File     : LB393+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 5 cases var 3
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( sigma(obj2) | rho(obj2) | tau(obj2) | nu(obj2) | mu(obj2) )).
fof(case0, axiom, ( ! [X] : ((sigma(X) => epsilon(X))) )).
fof(case1, axiom, ( ! [X] : ((rho(X) => epsilon(X))) )).
fof(case2, axiom, ( ! [X] : ((tau(X) => epsilon(X))) )).
fof(case3, axiom, ( ! [X] : ((nu(X) => epsilon(X))) )).
fof(case4, axiom, ( ! [X] : ((mu(X) => epsilon(X))) )).
fof(goal, conjecture, ( epsilon(obj2) )).
%------------------------------------------------------------------------------
