%------------------------------------------------------------------------------
% File     : LCL031+1
% Domain   : Logic Calculi
% Problem  : Existential generalization
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( p(a) )).
fof(goal, conjecture, ( ? [X] : (p(X)) )).
%------------------------------------------------------------------------------
