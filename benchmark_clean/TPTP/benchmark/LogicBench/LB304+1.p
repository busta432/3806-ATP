%------------------------------------------------------------------------------
% File     : LB304+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 2 var 4
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((xi(X) => alpha(X))) )).
fof(s2, axiom, ( ! [X] : ((alpha(X) => beta(X))) )).
fof(base, axiom, ( xi(obj3) )).
fof(goal, conjecture, ( beta(obj3) )).
%------------------------------------------------------------------------------
