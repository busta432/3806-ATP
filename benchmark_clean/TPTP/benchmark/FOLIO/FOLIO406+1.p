%------------------------------------------------------------------------------
% File     : FOLIO406+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : weight comparison chain 5
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((heavier(X,Y) & heavier(Y,Z) => heavier(X,Z))) )).
fof(f0, axiom, ( heavier(alice,bob) )).
fof(f1, axiom, ( heavier(bob,charlie) )).
fof(f2, axiom, ( heavier(charlie,diana) )).
fof(f3, axiom, ( heavier(diana,eve) )).
fof(f4, axiom, ( heavier(eve,frank) )).
fof(goal, conjecture, ( heavier(alice,frank) )).
%------------------------------------------------------------------------------
