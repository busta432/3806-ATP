%------------------------------------------------------------------------------
% File     : LB389+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 4 cases var 4
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( tau(obj3) | nu(obj3) | mu(obj3) | xi(obj3) )).
fof(case0, axiom, ( ! [X] : ((tau(X) => zeta(X))) )).
fof(case1, axiom, ( ! [X] : ((nu(X) => zeta(X))) )).
fof(case2, axiom, ( ! [X] : ((mu(X) => zeta(X))) )).
fof(case3, axiom, ( ! [X] : ((xi(X) => zeta(X))) )).
fof(goal, conjecture, ( zeta(obj3) )).
%------------------------------------------------------------------------------
