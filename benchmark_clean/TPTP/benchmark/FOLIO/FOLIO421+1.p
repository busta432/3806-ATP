%------------------------------------------------------------------------------
% File     : FOLIO421+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : cost comparison chain 5
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((cheaper(X,Y) & cheaper(Y,Z) => cheaper(X,Z))) )).
fof(f0, axiom, ( cheaper(alice,bob) )).
fof(f1, axiom, ( cheaper(bob,charlie) )).
fof(f2, axiom, ( cheaper(charlie,diana) )).
fof(f3, axiom, ( cheaper(diana,eve) )).
fof(f4, axiom, ( cheaper(eve,frank) )).
fof(goal, conjecture, ( cheaper(alice,frank) )).
%------------------------------------------------------------------------------
