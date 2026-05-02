%------------------------------------------------------------------------------
% File     : LB_CP_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 4
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => iota(X))) )).
fof(goal, conjecture, ( ! [X] : ((~iota(X) => ~delta(X))) )).
%------------------------------------------------------------------------------
