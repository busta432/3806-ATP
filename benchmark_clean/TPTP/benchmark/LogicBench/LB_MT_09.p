%------------------------------------------------------------------------------
% File     : LB_MT_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 9
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => delta(X))) )).
fof(p2, axiom, ( ~delta(c8) )).
fof(goal, conjecture, ( ~iota(c8) )).
%------------------------------------------------------------------------------
