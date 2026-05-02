%------------------------------------------------------------------------------
% File     : LB_RES_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 4
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( delta(c3) | iota(c3) )).
fof(p2, axiom, ( ~delta(c3) | r3(c3) )).
fof(goal, conjecture, ( iota(c3) | r3(c3) )).
%------------------------------------------------------------------------------
