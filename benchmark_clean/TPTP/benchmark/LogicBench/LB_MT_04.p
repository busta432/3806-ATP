%------------------------------------------------------------------------------
% File     : LB_MT_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 4
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => iota(X))) )).
fof(p2, axiom, ( ~iota(c3) )).
fof(goal, conjecture, ( ~delta(c3) )).
%------------------------------------------------------------------------------
