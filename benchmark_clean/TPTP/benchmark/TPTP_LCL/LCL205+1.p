%------------------------------------------------------------------------------
% File     : LCL205+1
% Domain   : Logic Calculi
% Problem  : Invalid: swap quantifier order
% Status   : CounterSatisfiable
% Rating   : 0.25 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(goal, conjecture, ( (! [X] : (? [Y] : (r(X,Y))) => ? [Y] : (! [X] : (r(X,Y)))) )).
%------------------------------------------------------------------------------
