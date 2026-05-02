%------------------------------------------------------------------------------
% File     : LB_RES_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 1
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( alpha(c0) | zeta(c0) )).
fof(p2, axiom, ( ~alpha(c0) | r0(c0) )).
fof(goal, conjecture, ( zeta(c0) | r0(c0) )).
%------------------------------------------------------------------------------
