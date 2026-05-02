%------------------------------------------------------------------------------
% File     : LB398+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 6 cases var 3
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( sigma(obj2) | rho(obj2) | tau(obj2) | nu(obj2) | mu(obj2) | xi(obj2) )).
fof(case0, axiom, ( ! [X] : ((sigma(X) => zeta(X))) )).
fof(case1, axiom, ( ! [X] : ((rho(X) => zeta(X))) )).
fof(case2, axiom, ( ! [X] : ((tau(X) => zeta(X))) )).
fof(case3, axiom, ( ! [X] : ((nu(X) => zeta(X))) )).
fof(case4, axiom, ( ! [X] : ((mu(X) => zeta(X))) )).
fof(case5, axiom, ( ! [X] : ((xi(X) => zeta(X))) )).
fof(goal, conjecture, ( zeta(obj2) )).
%------------------------------------------------------------------------------
