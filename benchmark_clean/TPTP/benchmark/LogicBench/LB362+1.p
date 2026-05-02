%------------------------------------------------------------------------------
% File     : LB362+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 12
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( beta(obj11) | epsilon(obj11) )).
fof(p2, axiom, ( ~beta(obj11) )).
fof(p3, axiom, ( ! [X] : ((epsilon(X) => iota(X))) )).
fof(goal, conjecture, ( iota(obj11) )).
%------------------------------------------------------------------------------
