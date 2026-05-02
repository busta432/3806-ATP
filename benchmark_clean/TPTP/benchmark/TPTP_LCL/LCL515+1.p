%------------------------------------------------------------------------------
% File     : LCL515+1
% Domain   : Logic Calculi
% Problem  : Nested conditional depth 6
% Status   : Theorem
% Rating   : 0.60 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax, axiom, ( ! [X] : (((((((p(X) => v0(X)) => v1(X)) => v2(X)) => v3(X)) => v4(X)) => v5(X))) )).
fof(holds, axiom, ( p(c) & v0(c) & v1(c) & v2(c) & v3(c) & v4(c) & v5(c) )).
fof(goal, conjecture, ( v5(c) )).
%------------------------------------------------------------------------------
