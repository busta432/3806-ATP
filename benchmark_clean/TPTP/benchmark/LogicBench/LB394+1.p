%------------------------------------------------------------------------------
% File     : LB394+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 5 cases var 4
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( tau(obj3) | nu(obj3) | mu(obj3) | xi(obj3) | alpha(obj3) )).
fof(case0, axiom, ( ! [X] : ((tau(X) => eta(X))) )).
fof(case1, axiom, ( ! [X] : ((nu(X) => eta(X))) )).
fof(case2, axiom, ( ! [X] : ((mu(X) => eta(X))) )).
fof(case3, axiom, ( ! [X] : ((xi(X) => eta(X))) )).
fof(case4, axiom, ( ! [X] : ((alpha(X) => eta(X))) )).
fof(goal, conjecture, ( eta(obj3) )).
%------------------------------------------------------------------------------
