%------------------------------------------------------------------------------
% File     : LB395+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 5 cases var 5
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( mu(obj4) | xi(obj4) | alpha(obj4) | beta(obj4) | gamma(obj4) )).
fof(case0, axiom, ( ! [X] : ((mu(X) => iota(X))) )).
fof(case1, axiom, ( ! [X] : ((xi(X) => iota(X))) )).
fof(case2, axiom, ( ! [X] : ((alpha(X) => iota(X))) )).
fof(case3, axiom, ( ! [X] : ((beta(X) => iota(X))) )).
fof(case4, axiom, ( ! [X] : ((gamma(X) => iota(X))) )).
fof(goal, conjecture, ( iota(obj4) )).
%------------------------------------------------------------------------------
