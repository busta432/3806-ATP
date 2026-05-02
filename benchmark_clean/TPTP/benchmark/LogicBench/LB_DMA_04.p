%------------------------------------------------------------------------------
% File     : LB_DMA_04
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan conjunction instance 4
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(delta(c3) & iota(c3)) )).
fof(p2, axiom, ( delta(c3) )).
fof(goal, conjecture, ( ~iota(c3) )).
%------------------------------------------------------------------------------
