%------------------------------------------------------------------------------
% File     : LB404+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 7 cases var 4
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( tau(obj3) | nu(obj3) | mu(obj3) | xi(obj3) | alpha(obj3) | beta(obj3) | gamma(obj3) )).
fof(case0, axiom, ( ! [X] : ((tau(X) => iota(X))) )).
fof(case1, axiom, ( ! [X] : ((nu(X) => iota(X))) )).
fof(case2, axiom, ( ! [X] : ((mu(X) => iota(X))) )).
fof(case3, axiom, ( ! [X] : ((xi(X) => iota(X))) )).
fof(case4, axiom, ( ! [X] : ((alpha(X) => iota(X))) )).
fof(case5, axiom, ( ! [X] : ((beta(X) => iota(X))) )).
fof(case6, axiom, ( ! [X] : ((gamma(X) => iota(X))) )).
fof(goal, conjecture, ( iota(obj3) )).
%------------------------------------------------------------------------------
