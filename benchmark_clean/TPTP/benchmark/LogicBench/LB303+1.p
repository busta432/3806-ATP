%------------------------------------------------------------------------------
% File     : LB303+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 2 var 3
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((tau(X) => nu(X))) )).
fof(s2, axiom, ( ! [X] : ((nu(X) => mu(X))) )).
fof(base, axiom, ( tau(obj2) )).
fof(goal, conjecture, ( mu(obj2) )).
%------------------------------------------------------------------------------
