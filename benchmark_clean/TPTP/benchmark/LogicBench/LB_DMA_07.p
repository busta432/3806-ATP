%------------------------------------------------------------------------------
% File     : LB_DMA_07
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan conjunction instance 7
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(eta(c6) & beta(c6)) )).
fof(p2, axiom, ( eta(c6) )).
fof(goal, conjecture, ( ~beta(c6) )).
%------------------------------------------------------------------------------
