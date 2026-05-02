%------------------------------------------------------------------------------
% File     : LB343+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 10 var 3
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((tau(X) => nu(X))) )).
fof(s2, axiom, ( ! [X] : ((nu(X) => mu(X))) )).
fof(s3, axiom, ( ! [X] : ((mu(X) => xi(X))) )).
fof(s4, axiom, ( ! [X] : ((xi(X) => alpha(X))) )).
fof(s5, axiom, ( ! [X] : ((alpha(X) => beta(X))) )).
fof(s6, axiom, ( ! [X] : ((beta(X) => gamma(X))) )).
fof(s7, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(s8, axiom, ( ! [X] : ((delta(X) => epsilon(X))) )).
fof(s9, axiom, ( ! [X] : ((epsilon(X) => zeta(X))) )).
fof(s10, axiom, ( ! [X] : ((zeta(X) => eta(X))) )).
fof(base, axiom, ( tau(obj2) )).
fof(goal, conjecture, ( eta(obj2) )).
%------------------------------------------------------------------------------
