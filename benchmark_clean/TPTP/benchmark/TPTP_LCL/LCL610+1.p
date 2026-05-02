%------------------------------------------------------------------------------
% File     : LCL610+1
% Domain   : Logic Calculi
% Problem  : Forall-exists interplay 11 elements
% Status   : Theorem
% Rating   : 0.45 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(witness, axiom, ( ! [X] : (? [Y] : (r(X,Y) & s(Y))) )).
fof(elem0, axiom, ( t(e0) )).
fof(elem1, axiom, ( t(e1) )).
fof(elem2, axiom, ( t(e2) )).
fof(elem3, axiom, ( t(e3) )).
fof(elem4, axiom, ( t(e4) )).
fof(elem5, axiom, ( t(e5) )).
fof(elem6, axiom, ( t(e6) )).
fof(elem7, axiom, ( t(e7) )).
fof(elem8, axiom, ( t(e8) )).
fof(elem9, axiom, ( t(e9) )).
fof(elem10, axiom, ( t(e10) )).
fof(chain, axiom, ( ! [X] : ((t(X) => ? [Y] : (r(X,Y)))) )).
fof(goal, conjecture, ( ? [Y] : (r(e0,Y)) )).
%------------------------------------------------------------------------------
