%------------------------------------------------------------------------------
% File     : LB_MT_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 1
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => zeta(X))) )).
fof(p2, axiom, ( ~zeta(c0) )).
fof(goal, conjecture, ( ~alpha(c0) )).
%------------------------------------------------------------------------------
