%------------------------------------------------------------------------------
% File     : LB_HS_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 1
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => mid0(X))) )).
fof(p2, axiom, ( ! [X] : ((mid0(X) => zeta(X))) )).
fof(goal, conjecture, ( ! [X] : ((alpha(X) => zeta(X))) )).
%------------------------------------------------------------------------------
