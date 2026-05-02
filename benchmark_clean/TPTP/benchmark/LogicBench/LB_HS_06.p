%------------------------------------------------------------------------------
% File     : LB_HS_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 6
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => mid5(X))) )).
fof(p2, axiom, ( ! [X] : ((mid5(X) => alpha(X))) )).
fof(goal, conjecture, ( ! [X] : ((zeta(X) => alpha(X))) )).
%------------------------------------------------------------------------------
