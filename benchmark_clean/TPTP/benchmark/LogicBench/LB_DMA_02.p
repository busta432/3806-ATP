%------------------------------------------------------------------------------
% File     : LB_DMA_02
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan conjunction instance 2
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(beta(c1) & eta(c1)) )).
fof(p2, axiom, ( beta(c1) )).
fof(goal, conjecture, ( ~eta(c1) )).
%------------------------------------------------------------------------------
