%------------------------------------------------------------------------------
% File     : LB370+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 20
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( kappa(obj19) | chi(obj19) )).
fof(p2, axiom, ( ~kappa(obj19) )).
fof(p3, axiom, ( ! [X] : ((chi(X) => tau(X))) )).
fof(goal, conjecture, ( tau(obj19) )).
%------------------------------------------------------------------------------
