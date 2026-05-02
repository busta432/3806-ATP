%------------------------------------------------------------------------------
% File     : LB_CP_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 6
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => alpha(X))) )).
fof(goal, conjecture, ( ! [X] : ((~alpha(X) => ~zeta(X))) )).
%------------------------------------------------------------------------------
