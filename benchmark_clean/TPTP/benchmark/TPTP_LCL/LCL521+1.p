%------------------------------------------------------------------------------
% File     : LCL521+1
% Domain   : Logic Calculi
% Problem  : Existential witness 4 elements
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(wit, axiom, ( ! [X] : (? [Y] : (r(X,Y))) )).
fof(elem0, axiom, ( elem(a0) )).
fof(elem1, axiom, ( elem(a1) )).
fof(elem2, axiom, ( elem(a2) )).
fof(elem3, axiom, ( elem(a3) )).
fof(goal, conjecture, ( ? [Y] : (r(a0,Y)) )).
%------------------------------------------------------------------------------
