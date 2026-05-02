%------------------------------------------------------------------------------
% File     : LCL520+1
% Domain   : Logic Calculi
% Problem  : Existential witness 3 elements
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(wit, axiom, ( ! [X] : (? [Y] : (r(X,Y))) )).
fof(elem0, axiom, ( elem(a0) )).
fof(elem1, axiom, ( elem(a1) )).
fof(elem2, axiom, ( elem(a2) )).
fof(goal, conjecture, ( ? [Y] : (r(a0,Y)) )).
%------------------------------------------------------------------------------
