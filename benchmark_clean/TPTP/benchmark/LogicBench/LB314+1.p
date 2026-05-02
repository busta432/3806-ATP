%------------------------------------------------------------------------------
% File     : LB314+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 4 var 4
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((xi(X) => alpha(X))) )).
fof(s2, axiom, ( ! [X] : ((alpha(X) => beta(X))) )).
fof(s3, axiom, ( ! [X] : ((beta(X) => gamma(X))) )).
fof(s4, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(base, axiom, ( xi(obj3) )).
fof(goal, conjecture, ( delta(obj3) )).
%------------------------------------------------------------------------------
