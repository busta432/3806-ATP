%------------------------------------------------------------------------------
% File     : LB_MT_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 8
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) => gamma(X))) )).
fof(p2, axiom, ( ~gamma(c7) )).
fof(goal, conjecture, ( ~theta(c7) )).
%------------------------------------------------------------------------------
