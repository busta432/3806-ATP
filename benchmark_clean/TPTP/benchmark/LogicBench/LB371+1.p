%------------------------------------------------------------------------------
% File     : LB371+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 21
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( phi(obj0) | omega(obj0) )).
fof(p2, axiom, ( ~phi(obj0) )).
fof(p3, axiom, ( ! [X] : ((omega(X) => nu(X))) )).
fof(goal, conjecture, ( nu(obj0) )).
%------------------------------------------------------------------------------
