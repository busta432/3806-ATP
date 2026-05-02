%------------------------------------------------------------------------------
% File     : LCL374+1
% Domain   : Logic Calculi
% Problem  : Mixed biconditional chain length 5
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq0, axiom, ( ! [X] : ((b0(X) <=> b1(X))) )).
fof(eq1, axiom, ( ! [X] : ((b2(X) <=> b1(X))) )).
fof(eq2, axiom, ( ! [X] : ((b2(X) <=> b3(X))) )).
fof(eq3, axiom, ( ! [X] : ((b4(X) <=> b3(X))) )).
fof(eq4, axiom, ( ! [X] : ((b4(X) <=> b5(X))) )).
fof(base, axiom, ( b0(c) )).
fof(goal, conjecture, ( b5(c) )).
%------------------------------------------------------------------------------
