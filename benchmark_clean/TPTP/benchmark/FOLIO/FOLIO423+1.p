%------------------------------------------------------------------------------
% File     : FOLIO423+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : strength comparison chain 4
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((stronger(X,Y) & stronger(Y,Z) => stronger(X,Z))) )).
fof(f0, axiom, ( stronger(alice,bob) )).
fof(f1, axiom, ( stronger(bob,charlie) )).
fof(f2, axiom, ( stronger(charlie,diana) )).
fof(f3, axiom, ( stronger(diana,eve) )).
fof(goal, conjecture, ( stronger(alice,eve) )).
%------------------------------------------------------------------------------
