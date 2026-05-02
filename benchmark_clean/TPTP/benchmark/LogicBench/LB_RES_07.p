%------------------------------------------------------------------------------
% File     : LB_RES_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 7
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( eta(c6) | beta(c6) )).
fof(p2, axiom, ( ~eta(c6) | r6(c6) )).
fof(goal, conjecture, ( beta(c6) | r6(c6) )).
%------------------------------------------------------------------------------
