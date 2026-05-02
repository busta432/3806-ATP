%------------------------------------------------------------------------------
% File     : LB387+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 4 cases var 2
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( chi(obj1) | omega(obj1) | sigma(obj1) | rho(obj1) )).
fof(case0, axiom, ( ! [X] : ((chi(X) => beta(X))) )).
fof(case1, axiom, ( ! [X] : ((omega(X) => beta(X))) )).
fof(case2, axiom, ( ! [X] : ((sigma(X) => beta(X))) )).
fof(case3, axiom, ( ! [X] : ((rho(X) => beta(X))) )).
fof(goal, conjecture, ( beta(obj1) )).
%------------------------------------------------------------------------------
