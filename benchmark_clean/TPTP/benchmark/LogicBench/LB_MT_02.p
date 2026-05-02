%------------------------------------------------------------------------------
% File     : LB_MT_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 2
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => eta(X))) )).
fof(p2, axiom, ( ~eta(c1) )).
fof(goal, conjecture, ( ~beta(c1) )).
%------------------------------------------------------------------------------
