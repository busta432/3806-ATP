%------------------------------------------------------------------------------
% File     : LB_DMA_05
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan conjunction instance 5
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(epsilon(c4) & kappa(c4)) )).
fof(p2, axiom, ( epsilon(c4) )).
fof(goal, conjecture, ( ~kappa(c4) )).
%------------------------------------------------------------------------------
