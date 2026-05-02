%------------------------------------------------------------------------------
% File     : LCL603+1
% Domain   : Logic Calculi
% Problem  : Forall-exists interplay 4 elements
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(witness, axiom, ( ! [X] : (? [Y] : (r(X,Y) & s(Y))) )).
fof(elem0, axiom, ( t(e0) )).
fof(elem1, axiom, ( t(e1) )).
fof(elem2, axiom, ( t(e2) )).
fof(elem3, axiom, ( t(e3) )).
fof(chain, axiom, ( ! [X] : ((t(X) => ? [Y] : (r(X,Y)))) )).
fof(goal, conjecture, ( ? [Y] : (r(e0,Y)) )).
%------------------------------------------------------------------------------
