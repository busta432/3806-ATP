%------------------------------------------------------------------------------
% File     : LB325+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 6 var 5
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(s2, axiom, ( ! [X] : ((delta(X) => epsilon(X))) )).
fof(s3, axiom, ( ! [X] : ((epsilon(X) => zeta(X))) )).
fof(s4, axiom, ( ! [X] : ((zeta(X) => eta(X))) )).
fof(s5, axiom, ( ! [X] : ((eta(X) => theta(X))) )).
fof(s6, axiom, ( ! [X] : ((theta(X) => iota(X))) )).
fof(base, axiom, ( gamma(obj4) )).
fof(goal, conjecture, ( iota(obj4) )).
%------------------------------------------------------------------------------
