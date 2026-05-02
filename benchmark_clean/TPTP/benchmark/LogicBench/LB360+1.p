%------------------------------------------------------------------------------
% File     : LB360+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 10
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( xi(obj9) | gamma(obj9) )).
fof(p2, axiom, ( ~xi(obj9) )).
fof(p3, axiom, ( ! [X] : ((gamma(X) => eta(X))) )).
fof(goal, conjecture, ( eta(obj9) )).
%------------------------------------------------------------------------------
