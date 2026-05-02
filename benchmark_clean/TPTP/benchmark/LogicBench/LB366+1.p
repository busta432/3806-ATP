%------------------------------------------------------------------------------
% File     : LB366+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 16
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( zeta(obj15) | iota(obj15) )).
fof(p2, axiom, ( ~zeta(obj15) )).
fof(p3, axiom, ( ! [X] : ((iota(X) => chi(X))) )).
fof(goal, conjecture, ( chi(obj15) )).
%------------------------------------------------------------------------------
