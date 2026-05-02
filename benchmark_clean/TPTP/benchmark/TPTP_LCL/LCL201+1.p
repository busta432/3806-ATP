%------------------------------------------------------------------------------
% File     : LCL201+1
% Domain   : Logic Calculi
% Problem  : Invalid: denying antecedent
% Status   : CounterSatisfiable
% Rating   : 0.05 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(goal, conjecture, ( ! [X] : (((p(X) => q(X)) & ~p(X) => ~q(X))) )).
%------------------------------------------------------------------------------
