%------------------------------------------------------------------------------
% File     : LB359+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 9
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( mu(obj8) | beta(obj8) )).
fof(p2, axiom, ( ~mu(obj8) )).
fof(p3, axiom, ( ! [X] : ((beta(X) => zeta(X))) )).
fof(goal, conjecture, ( zeta(obj8) )).
%------------------------------------------------------------------------------
