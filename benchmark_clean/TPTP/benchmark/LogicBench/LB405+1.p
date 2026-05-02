%------------------------------------------------------------------------------
% File     : LB405+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 7 cases var 5
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( mu(obj4) | xi(obj4) | alpha(obj4) | beta(obj4) | gamma(obj4) | delta(obj4) | epsilon(obj4) )).
fof(case0, axiom, ( ! [X] : ((mu(X) => phi(X))) )).
fof(case1, axiom, ( ! [X] : ((xi(X) => phi(X))) )).
fof(case2, axiom, ( ! [X] : ((alpha(X) => phi(X))) )).
fof(case3, axiom, ( ! [X] : ((beta(X) => phi(X))) )).
fof(case4, axiom, ( ! [X] : ((gamma(X) => phi(X))) )).
fof(case5, axiom, ( ! [X] : ((delta(X) => phi(X))) )).
fof(case6, axiom, ( ! [X] : ((epsilon(X) => phi(X))) )).
fof(goal, conjecture, ( phi(obj4) )).
%------------------------------------------------------------------------------
