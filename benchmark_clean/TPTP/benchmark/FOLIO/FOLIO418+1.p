%------------------------------------------------------------------------------
% File     : FOLIO418+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : volume comparison chain 5
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((louder(X,Y) & louder(Y,Z) => louder(X,Z))) )).
fof(f0, axiom, ( louder(alice,bob) )).
fof(f1, axiom, ( louder(bob,charlie) )).
fof(f2, axiom, ( louder(charlie,diana) )).
fof(f3, axiom, ( louder(diana,eve) )).
fof(f4, axiom, ( louder(eve,frank) )).
fof(goal, conjecture, ( louder(alice,frank) )).
%------------------------------------------------------------------------------
