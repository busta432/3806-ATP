%------------------------------------------------------------------------------
% File     : LB_CP_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 2
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => eta(X))) )).
fof(goal, conjecture, ( ! [X] : ((~eta(X) => ~beta(X))) )).
%------------------------------------------------------------------------------
