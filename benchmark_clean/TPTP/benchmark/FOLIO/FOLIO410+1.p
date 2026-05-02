%------------------------------------------------------------------------------
% File     : FOLIO410+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : age comparison chain 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((older(X,Y) & older(Y,Z) => older(X,Z))) )).
fof(f0, axiom, ( older(alice,bob) )).
fof(f1, axiom, ( older(bob,charlie) )).
fof(f2, axiom, ( older(charlie,diana) )).
fof(goal, conjecture, ( older(alice,diana) )).
%------------------------------------------------------------------------------
