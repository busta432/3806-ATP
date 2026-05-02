%------------------------------------------------------------------------------
% File     : LB306+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 3 var 1
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((phi(X) => psi(X))) )).
fof(s2, axiom, ( ! [X] : ((psi(X) => chi(X))) )).
fof(s3, axiom, ( ! [X] : ((chi(X) => omega(X))) )).
fof(base, axiom, ( phi(obj0) )).
fof(goal, conjecture, ( omega(obj0) )).
%------------------------------------------------------------------------------
