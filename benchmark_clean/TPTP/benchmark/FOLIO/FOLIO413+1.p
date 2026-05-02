%------------------------------------------------------------------------------
% File     : FOLIO413+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : luminosity comparison chain 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((brighter(X,Y) & brighter(Y,Z) => brighter(X,Z))) )).
fof(f0, axiom, ( brighter(alice,bob) )).
fof(f1, axiom, ( brighter(bob,charlie) )).
fof(f2, axiom, ( brighter(charlie,diana) )).
fof(goal, conjecture, ( brighter(alice,diana) )).
%------------------------------------------------------------------------------
