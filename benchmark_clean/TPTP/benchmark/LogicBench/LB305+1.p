%------------------------------------------------------------------------------
% File     : LB305+1
% Domain   : Inference Rules (LogicBench)
% Problem  : MP chain depth 2 var 5
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((gamma(X) => delta(X))) )).
fof(s2, axiom, ( ! [X] : ((delta(X) => epsilon(X))) )).
fof(base, axiom, ( gamma(obj4) )).
fof(goal, conjecture, ( epsilon(obj4) )).
%------------------------------------------------------------------------------
