%------------------------------------------------------------------------------
% File     : LB334+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 8 var 4
% Status   : Theorem
% Rating   : 0.32 v1.0.0
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
fof(base, axiom, ( xi(obj3) )).
fof(goal, conjecture, ( theta(obj3) )).
%------------------------------------------------------------------------------
