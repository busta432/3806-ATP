%------------------------------------------------------------------------------
% File     : LCL519+1
% Domain   : Logic Calculi
% Problem  : Existential witness 2 elements
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(wit, axiom, ( ! [X] : (? [Y] : (r(X,Y))) )).
fof(elem0, axiom, ( elem(a0) )).
fof(elem1, axiom, ( elem(a1) )).
fof(goal, conjecture, ( ? [Y] : (r(a0,Y)) )).
%------------------------------------------------------------------------------
