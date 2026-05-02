%------------------------------------------------------------------------------
% File     : LB388+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 4 cases var 3
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( sigma(obj2) | rho(obj2) | tau(obj2) | nu(obj2) )).
fof(case0, axiom, ( ! [X] : ((sigma(X) => delta(X))) )).
fof(case1, axiom, ( ! [X] : ((rho(X) => delta(X))) )).
fof(case2, axiom, ( ! [X] : ((tau(X) => delta(X))) )).
fof(case3, axiom, ( ! [X] : ((nu(X) => delta(X))) )).
fof(goal, conjecture, ( delta(obj2) )).
%------------------------------------------------------------------------------
