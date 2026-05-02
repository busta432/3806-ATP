%------------------------------------------------------------------------------
% File     : LB_RES_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 9
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(c8) | delta(c8) )).
fof(p2, axiom, ( ~iota(c8) | r8(c8) )).
fof(goal, conjecture, ( delta(c8) | r8(c8) )).
%------------------------------------------------------------------------------
