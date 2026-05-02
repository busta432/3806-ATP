%------------------------------------------------------------------------------
% File     : LCL513+1
% Domain   : Logic Calculi
% Problem  : Nested conditional depth 4
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax, axiom, ( ! [X] : (((((p(X) => v0(X)) => v1(X)) => v2(X)) => v3(X))) )).
fof(holds, axiom, ( p(c) & v0(c) & v1(c) & v2(c) & v3(c) )).
fof(goal, conjecture, ( v3(c) )).
%------------------------------------------------------------------------------
