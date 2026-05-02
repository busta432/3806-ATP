%------------------------------------------------------------------------------
% File     : LB386+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 4 cases var 1
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( phi(obj0) | psi(obj0) | chi(obj0) | omega(obj0) )).
fof(case0, axiom, ( ! [X] : ((phi(X) => xi(X))) )).
fof(case1, axiom, ( ! [X] : ((psi(X) => xi(X))) )).
fof(case2, axiom, ( ! [X] : ((chi(X) => xi(X))) )).
fof(case3, axiom, ( ! [X] : ((omega(X) => xi(X))) )).
fof(goal, conjecture, ( xi(obj0) )).
%------------------------------------------------------------------------------
