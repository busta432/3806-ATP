%------------------------------------------------------------------------------
% File     : LB_HS_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 8
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) => mid7(X))) )).
fof(p2, axiom, ( ! [X] : ((mid7(X) => gamma(X))) )).
fof(goal, conjecture, ( ! [X] : ((theta(X) => gamma(X))) )).
%------------------------------------------------------------------------------
