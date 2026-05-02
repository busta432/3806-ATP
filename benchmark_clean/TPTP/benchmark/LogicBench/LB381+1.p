%------------------------------------------------------------------------------
% File     : LB381+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 3 cases var 1
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( phi(obj0) | psi(obj0) | chi(obj0) )).
fof(case0, axiom, ( ! [X] : ((phi(X) => mu(X))) )).
fof(case1, axiom, ( ! [X] : ((psi(X) => mu(X))) )).
fof(case2, axiom, ( ! [X] : ((chi(X) => mu(X))) )).
fof(goal, conjecture, ( mu(obj0) )).
%------------------------------------------------------------------------------
