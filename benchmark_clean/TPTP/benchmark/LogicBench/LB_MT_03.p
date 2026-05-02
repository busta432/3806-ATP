%------------------------------------------------------------------------------
% File     : LB_MT_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 3
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => theta(X))) )).
fof(p2, axiom, ( ~theta(c2) )).
fof(goal, conjecture, ( ~gamma(c2) )).
%------------------------------------------------------------------------------
