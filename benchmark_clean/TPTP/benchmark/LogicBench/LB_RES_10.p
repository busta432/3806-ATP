%------------------------------------------------------------------------------
% File     : LB_RES_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 10
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( kappa(c9) | epsilon(c9) )).
fof(p2, axiom, ( ~kappa(c9) | r9(c9) )).
fof(goal, conjecture, ( epsilon(c9) | r9(c9) )).
%------------------------------------------------------------------------------
