%------------------------------------------------------------------------------
% File     : LB391+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 5 cases var 1
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( phi(obj0) | psi(obj0) | chi(obj0) | omega(obj0) | sigma(obj0) )).
fof(case0, axiom, ( ! [X] : ((phi(X) => alpha(X))) )).
fof(case1, axiom, ( ! [X] : ((psi(X) => alpha(X))) )).
fof(case2, axiom, ( ! [X] : ((chi(X) => alpha(X))) )).
fof(case3, axiom, ( ! [X] : ((omega(X) => alpha(X))) )).
fof(case4, axiom, ( ! [X] : ((sigma(X) => alpha(X))) )).
fof(goal, conjecture, ( alpha(obj0) )).
%------------------------------------------------------------------------------
