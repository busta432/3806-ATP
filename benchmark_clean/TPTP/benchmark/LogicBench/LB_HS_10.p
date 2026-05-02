%------------------------------------------------------------------------------
% File     : LB_HS_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 10
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => mid9(X))) )).
fof(p2, axiom, ( ! [X] : ((mid9(X) => epsilon(X))) )).
fof(goal, conjecture, ( ! [X] : ((kappa(X) => epsilon(X))) )).
%------------------------------------------------------------------------------
