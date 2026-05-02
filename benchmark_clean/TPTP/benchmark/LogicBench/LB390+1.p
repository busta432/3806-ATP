%------------------------------------------------------------------------------
% File     : LB390+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 4 cases var 5
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( mu(obj4) | xi(obj4) | alpha(obj4) | beta(obj4) )).
fof(case0, axiom, ( ! [X] : ((mu(X) => theta(X))) )).
fof(case1, axiom, ( ! [X] : ((xi(X) => theta(X))) )).
fof(case2, axiom, ( ! [X] : ((alpha(X) => theta(X))) )).
fof(case3, axiom, ( ! [X] : ((beta(X) => theta(X))) )).
fof(goal, conjecture, ( theta(obj4) )).
%------------------------------------------------------------------------------
