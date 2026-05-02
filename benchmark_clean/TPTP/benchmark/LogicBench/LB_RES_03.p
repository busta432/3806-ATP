%------------------------------------------------------------------------------
% File     : LB_RES_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( gamma(c2) | theta(c2) )).
fof(p2, axiom, ( ~gamma(c2) | r2(c2) )).
fof(goal, conjecture, ( theta(c2) | r2(c2) )).
%------------------------------------------------------------------------------
