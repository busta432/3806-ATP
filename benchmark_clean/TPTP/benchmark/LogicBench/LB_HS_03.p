%------------------------------------------------------------------------------
% File     : LB_HS_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 3
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => mid2(X))) )).
fof(p2, axiom, ( ! [X] : ((mid2(X) => theta(X))) )).
fof(goal, conjecture, ( ! [X] : ((gamma(X) => theta(X))) )).
%------------------------------------------------------------------------------
