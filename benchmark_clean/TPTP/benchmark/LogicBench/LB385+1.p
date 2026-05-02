%------------------------------------------------------------------------------
% File     : LB385+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 3 cases var 5
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( mu(obj4) | xi(obj4) | alpha(obj4) )).
fof(case0, axiom, ( ! [X] : ((mu(X) => eta(X))) )).
fof(case1, axiom, ( ! [X] : ((xi(X) => eta(X))) )).
fof(case2, axiom, ( ! [X] : ((alpha(X) => eta(X))) )).
fof(goal, conjecture, ( eta(obj4) )).
%------------------------------------------------------------------------------
