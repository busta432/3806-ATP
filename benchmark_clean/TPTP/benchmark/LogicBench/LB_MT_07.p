%------------------------------------------------------------------------------
% File     : LB_MT_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 7
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => beta(X))) )).
fof(p2, axiom, ( ~beta(c6) )).
fof(goal, conjecture, ( ~eta(c6) )).
%------------------------------------------------------------------------------
