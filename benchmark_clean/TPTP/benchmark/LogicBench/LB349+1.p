%------------------------------------------------------------------------------
% File     : LB349+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 11 var 4
% Status   : Theorem
% Rating   : 0.44 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((xi(X) => alpha(X))) )).
fof(s2, axiom, ( ! [X] : ((alpha(X) => beta(X))) )).
fof(s3, axiom, ( ! [X] : ((beta(X) => gamma(X))) )).
fof(s4, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(s5, axiom, ( ! [X] : ((delta(X) => epsilon(X))) )).
fof(s6, axiom, ( ! [X] : ((epsilon(X) => zeta(X))) )).
fof(s7, axiom, ( ! [X] : ((zeta(X) => eta(X))) )).
fof(s8, axiom, ( ! [X] : ((eta(X) => theta(X))) )).
fof(s9, axiom, ( ! [X] : ((theta(X) => iota(X))) )).
fof(s10, axiom, ( ! [X] : ((iota(X) => kappa(X))) )).
fof(s11, axiom, ( ! [X] : ((kappa(X) => phi(X))) )).
fof(base, axiom, ( xi(obj3) )).
fof(goal, conjecture, ( phi(obj3) )).
%------------------------------------------------------------------------------
