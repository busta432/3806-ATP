%------------------------------------------------------------------------------
% File     : LB397+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 6 cases var 2
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( chi(obj1) | omega(obj1) | sigma(obj1) | rho(obj1) | tau(obj1) | nu(obj1) )).
fof(case0, axiom, ( ! [X] : ((chi(X) => delta(X))) )).
fof(case1, axiom, ( ! [X] : ((omega(X) => delta(X))) )).
fof(case2, axiom, ( ! [X] : ((sigma(X) => delta(X))) )).
fof(case3, axiom, ( ! [X] : ((rho(X) => delta(X))) )).
fof(case4, axiom, ( ! [X] : ((tau(X) => delta(X))) )).
fof(case5, axiom, ( ! [X] : ((nu(X) => delta(X))) )).
fof(goal, conjecture, ( delta(obj1) )).
%------------------------------------------------------------------------------
