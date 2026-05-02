%------------------------------------------------------------------------------
% File     : LB377+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 27
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( tau(obj6) | xi(obj6) )).
fof(p2, axiom, ( ~tau(obj6) )).
fof(p3, axiom, ( ! [X] : ((xi(X) => delta(X))) )).
fof(goal, conjecture, ( delta(obj6) )).
%------------------------------------------------------------------------------
