%------------------------------------------------------------------------------
% File     : LB402+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 7 cases var 2
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( chi(obj1) | omega(obj1) | sigma(obj1) | rho(obj1) | tau(obj1) | nu(obj1) | mu(obj1) )).
fof(case0, axiom, ( ! [X] : ((chi(X) => epsilon(X))) )).
fof(case1, axiom, ( ! [X] : ((omega(X) => epsilon(X))) )).
fof(case2, axiom, ( ! [X] : ((sigma(X) => epsilon(X))) )).
fof(case3, axiom, ( ! [X] : ((rho(X) => epsilon(X))) )).
fof(case4, axiom, ( ! [X] : ((tau(X) => epsilon(X))) )).
fof(case5, axiom, ( ! [X] : ((nu(X) => epsilon(X))) )).
fof(case6, axiom, ( ! [X] : ((mu(X) => epsilon(X))) )).
fof(goal, conjecture, ( epsilon(obj1) )).
%------------------------------------------------------------------------------
