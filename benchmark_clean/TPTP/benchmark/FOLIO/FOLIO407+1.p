%------------------------------------------------------------------------------
% File     : FOLIO407+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : height comparison chain 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((taller(X,Y) & taller(Y,Z) => taller(X,Z))) )).
fof(f0, axiom, ( taller(alice,bob) )).
fof(f1, axiom, ( taller(bob,charlie) )).
fof(f2, axiom, ( taller(charlie,diana) )).
fof(goal, conjecture, ( taller(alice,diana) )).
%------------------------------------------------------------------------------
