%------------------------------------------------------------------------------
% File     : LB400+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 6 cases var 5
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( mu(obj4) | xi(obj4) | alpha(obj4) | beta(obj4) | gamma(obj4) | delta(obj4) )).
fof(case0, axiom, ( ! [X] : ((mu(X) => kappa(X))) )).
fof(case1, axiom, ( ! [X] : ((xi(X) => kappa(X))) )).
fof(case2, axiom, ( ! [X] : ((alpha(X) => kappa(X))) )).
fof(case3, axiom, ( ! [X] : ((beta(X) => kappa(X))) )).
fof(case4, axiom, ( ! [X] : ((gamma(X) => kappa(X))) )).
fof(case5, axiom, ( ! [X] : ((delta(X) => kappa(X))) )).
fof(goal, conjecture, ( kappa(obj4) )).
%------------------------------------------------------------------------------
