%------------------------------------------------------------------------------
% File     : LB_MT_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 6
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => alpha(X))) )).
fof(p2, axiom, ( ~alpha(c5) )).
fof(goal, conjecture, ( ~zeta(c5) )).
%------------------------------------------------------------------------------
