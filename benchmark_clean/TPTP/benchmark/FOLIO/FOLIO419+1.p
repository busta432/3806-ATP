%------------------------------------------------------------------------------
% File     : FOLIO419+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : cost comparison chain 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((cheaper(X,Y) & cheaper(Y,Z) => cheaper(X,Z))) )).
fof(f0, axiom, ( cheaper(alice,bob) )).
fof(f1, axiom, ( cheaper(bob,charlie) )).
fof(f2, axiom, ( cheaper(charlie,diana) )).
fof(goal, conjecture, ( cheaper(alice,diana) )).
%------------------------------------------------------------------------------
