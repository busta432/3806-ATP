%------------------------------------------------------------------------------
% File     : LB315+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 4 var 5
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(s2, axiom, ( ! [X] : ((delta(X) => epsilon(X))) )).
fof(s3, axiom, ( ! [X] : ((epsilon(X) => zeta(X))) )).
fof(s4, axiom, ( ! [X] : ((zeta(X) => eta(X))) )).
fof(base, axiom, ( gamma(obj4) )).
fof(goal, conjecture, ( eta(obj4) )).
%------------------------------------------------------------------------------
