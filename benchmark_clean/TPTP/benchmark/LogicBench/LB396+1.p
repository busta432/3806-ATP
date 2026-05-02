%------------------------------------------------------------------------------
% File     : LB396+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 6 cases var 1
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( phi(obj0) | psi(obj0) | chi(obj0) | omega(obj0) | sigma(obj0) | rho(obj0) )).
fof(case0, axiom, ( ! [X] : ((phi(X) => beta(X))) )).
fof(case1, axiom, ( ! [X] : ((psi(X) => beta(X))) )).
fof(case2, axiom, ( ! [X] : ((chi(X) => beta(X))) )).
fof(case3, axiom, ( ! [X] : ((omega(X) => beta(X))) )).
fof(case4, axiom, ( ! [X] : ((sigma(X) => beta(X))) )).
fof(case5, axiom, ( ! [X] : ((rho(X) => beta(X))) )).
fof(goal, conjecture, ( beta(obj0) )).
%------------------------------------------------------------------------------
