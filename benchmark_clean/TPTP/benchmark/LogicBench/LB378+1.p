%------------------------------------------------------------------------------
% File     : LB378+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 28
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( nu(obj7) | alpha(obj7) )).
fof(p2, axiom, ( ~nu(obj7) )).
fof(p3, axiom, ( ! [X] : ((alpha(X) => epsilon(X))) )).
fof(goal, conjecture, ( epsilon(obj7) )).
%------------------------------------------------------------------------------
