%------------------------------------------------------------------------------
% File     : LCL526+1
% Domain   : Logic Calculi
% Problem  : Existential witness 9 elements
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(wit, axiom, ( ! [X] : (? [Y] : (r(X,Y))) )).
fof(elem0, axiom, ( elem(a0) )).
fof(elem1, axiom, ( elem(a1) )).
fof(elem2, axiom, ( elem(a2) )).
fof(elem3, axiom, ( elem(a3) )).
fof(elem4, axiom, ( elem(a4) )).
fof(elem5, axiom, ( elem(a5) )).
fof(elem6, axiom, ( elem(a6) )).
fof(elem7, axiom, ( elem(a7) )).
fof(elem8, axiom, ( elem(a8) )).
fof(goal, conjecture, ( ? [Y] : (r(a0,Y)) )).
%------------------------------------------------------------------------------
