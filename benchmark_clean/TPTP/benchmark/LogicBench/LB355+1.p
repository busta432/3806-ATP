%------------------------------------------------------------------------------
% File     : LB355+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 5
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( sigma(obj4) | nu(obj4) )).
fof(p2, axiom, ( ~sigma(obj4) )).
fof(p3, axiom, ( ! [X] : ((nu(X) => beta(X))) )).
fof(goal, conjecture, ( beta(obj4) )).
%------------------------------------------------------------------------------
