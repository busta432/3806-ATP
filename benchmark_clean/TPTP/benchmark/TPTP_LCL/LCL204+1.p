%------------------------------------------------------------------------------
% File     : LCL204+1
% Domain   : Logic Calculi
% Problem  : Invalid: conjunction from disjunction
% Status   : CounterSatisfiable
% Rating   : 0.10 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(goal, conjecture, ( ! [X] : ((p(X) | q(X) => p(X) & q(X))) )).
%------------------------------------------------------------------------------
