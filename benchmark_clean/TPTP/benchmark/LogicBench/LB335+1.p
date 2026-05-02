%------------------------------------------------------------------------------
% File     : LB335+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 8 var 5
% Status   : Theorem
% Rating   : 0.32 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(s2, axiom, ( ! [X] : ((delta(X) => epsilon(X))) )).
fof(s3, axiom, ( ! [X] : ((epsilon(X) => zeta(X))) )).
fof(s4, axiom, ( ! [X] : ((zeta(X) => eta(X))) )).
fof(s5, axiom, ( ! [X] : ((eta(X) => theta(X))) )).
fof(s6, axiom, ( ! [X] : ((theta(X) => iota(X))) )).
fof(s7, axiom, ( ! [X] : ((iota(X) => kappa(X))) )).
fof(s8, axiom, ( ! [X] : ((kappa(X) => phi(X))) )).
fof(base, axiom, ( gamma(obj4) )).
fof(goal, conjecture, ( phi(obj4) )).
%------------------------------------------------------------------------------
