%------------------------------------------------------------------------------
% File     : LCL144+1
% Domain   : Logic Calculi
% Problem  : Equivalence chain length 4
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq1, axiom, ( ! [X] : ((p0(X) <=> p1(X))) )).
fof(eq2, axiom, ( ! [X] : ((p1(X) <=> p2(X))) )).
fof(eq3, axiom, ( ! [X] : ((p2(X) <=> p3(X))) )).
fof(goal, conjecture, ( ! [X] : ((p0(X) <=> p3(X))) )).
%------------------------------------------------------------------------------
