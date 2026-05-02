%------------------------------------------------------------------------------
% File     : LB313+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 4 var 3
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((tau(X) => nu(X))) )).
fof(s2, axiom, ( ! [X] : ((nu(X) => mu(X))) )).
fof(s3, axiom, ( ! [X] : ((mu(X) => xi(X))) )).
fof(s4, axiom, ( ! [X] : ((xi(X) => alpha(X))) )).
fof(base, axiom, ( tau(obj2) )).
fof(goal, conjecture, ( alpha(obj2) )).
%------------------------------------------------------------------------------
