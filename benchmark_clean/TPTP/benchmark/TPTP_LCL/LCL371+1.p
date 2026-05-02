%------------------------------------------------------------------------------
% File     : LCL371+1
% Domain   : Logic Calculi
% Problem  : Mixed biconditional chain length 2
% Status   : Theorem
% Rating   : 0.14 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq0, axiom, ( ! [X] : ((b0(X) <=> b1(X))) )).
fof(eq1, axiom, ( ! [X] : ((b2(X) <=> b1(X))) )).
fof(base, axiom, ( b0(c) )).
fof(goal, conjecture, ( b2(c) )).
%------------------------------------------------------------------------------
