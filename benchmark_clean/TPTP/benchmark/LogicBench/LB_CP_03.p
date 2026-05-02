%------------------------------------------------------------------------------
% File     : LB_CP_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 3
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => theta(X))) )).
fof(goal, conjecture, ( ! [X] : ((~theta(X) => ~gamma(X))) )).
%------------------------------------------------------------------------------
