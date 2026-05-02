%------------------------------------------------------------------------------
% File     : LB336+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 9 var 1
% Status   : Theorem
% Rating   : 0.36 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((phi(X) => psi(X))) )).
fof(s2, axiom, ( ! [X] : ((psi(X) => chi(X))) )).
fof(s3, axiom, ( ! [X] : ((chi(X) => omega(X))) )).
fof(s4, axiom, ( ! [X] : ((omega(X) => sigma(X))) )).
fof(s5, axiom, ( ! [X] : ((sigma(X) => rho(X))) )).
fof(s6, axiom, ( ! [X] : ((rho(X) => tau(X))) )).
fof(s7, axiom, ( ! [X] : ((tau(X) => nu(X))) )).
fof(s8, axiom, ( ! [X] : ((nu(X) => mu(X))) )).
fof(s9, axiom, ( ! [X] : ((mu(X) => xi(X))) )).
fof(base, axiom, ( phi(obj0) )).
fof(goal, conjecture, ( xi(obj0) )).
%------------------------------------------------------------------------------
