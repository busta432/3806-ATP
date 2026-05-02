%------------------------------------------------------------------------------
% File     : LB_HS_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 5
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => mid4(X))) )).
fof(p2, axiom, ( ! [X] : ((mid4(X) => kappa(X))) )).
fof(goal, conjecture, ( ! [X] : ((epsilon(X) => kappa(X))) )).
%------------------------------------------------------------------------------
