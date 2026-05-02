%------------------------------------------------------------------------------
% File     : LB_HS_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 2
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => mid1(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1(X) => eta(X))) )).
fof(goal, conjecture, ( ! [X] : ((beta(X) => eta(X))) )).
%------------------------------------------------------------------------------
