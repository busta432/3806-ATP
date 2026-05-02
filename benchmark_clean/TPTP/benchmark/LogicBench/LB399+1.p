%------------------------------------------------------------------------------
% File     : LB399+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 6 cases var 4
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( tau(obj3) | nu(obj3) | mu(obj3) | xi(obj3) | alpha(obj3) | beta(obj3) )).
fof(case0, axiom, ( ! [X] : ((tau(X) => theta(X))) )).
fof(case1, axiom, ( ! [X] : ((nu(X) => theta(X))) )).
fof(case2, axiom, ( ! [X] : ((mu(X) => theta(X))) )).
fof(case3, axiom, ( ! [X] : ((xi(X) => theta(X))) )).
fof(case4, axiom, ( ! [X] : ((alpha(X) => theta(X))) )).
fof(case5, axiom, ( ! [X] : ((beta(X) => theta(X))) )).
fof(goal, conjecture, ( theta(obj3) )).
%------------------------------------------------------------------------------
