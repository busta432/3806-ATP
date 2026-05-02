%------------------------------------------------------------------------------
% File     : LB382+1
% Domain   : Inference Rules (LogicBench)
% Problem  : Proof by 3 cases var 2
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( chi(obj1) | omega(obj1) | sigma(obj1) )).
fof(case0, axiom, ( ! [X] : ((chi(X) => alpha(X))) )).
fof(case1, axiom, ( ! [X] : ((omega(X) => alpha(X))) )).
fof(case2, axiom, ( ! [X] : ((sigma(X) => alpha(X))) )).
fof(goal, conjecture, ( alpha(obj1) )).
%------------------------------------------------------------------------------
