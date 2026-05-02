%------------------------------------------------------------------------------
% File     : LB384+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 3 cases var 4
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( tau(obj3) | nu(obj3) | mu(obj3) )).
fof(case0, axiom, ( ! [X] : ((tau(X) => epsilon(X))) )).
fof(case1, axiom, ( ! [X] : ((nu(X) => epsilon(X))) )).
fof(case2, axiom, ( ! [X] : ((mu(X) => epsilon(X))) )).
fof(goal, conjecture, ( epsilon(obj3) )).
%------------------------------------------------------------------------------
