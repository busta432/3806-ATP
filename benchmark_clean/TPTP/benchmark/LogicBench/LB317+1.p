%------------------------------------------------------------------------------
% File     : LB317+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 5 var 2
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((omega(X) => sigma(X))) )).
fof(s2, axiom, ( ! [X] : ((sigma(X) => rho(X))) )).
fof(s3, axiom, ( ! [X] : ((rho(X) => tau(X))) )).
fof(s4, axiom, ( ! [X] : ((tau(X) => nu(X))) )).
fof(s5, axiom, ( ! [X] : ((nu(X) => mu(X))) )).
fof(base, axiom, ( omega(obj1) )).
fof(goal, conjecture, ( mu(obj1) )).
%------------------------------------------------------------------------------
