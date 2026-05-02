%------------------------------------------------------------------------------
% File     : LB_DMA_03
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan conjunction instance 3
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(gamma(c2) & theta(c2)) )).
fof(p2, axiom, ( gamma(c2) )).
fof(goal, conjecture, ( ~theta(c2) )).
%------------------------------------------------------------------------------
