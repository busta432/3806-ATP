%------------------------------------------------------------------------------
% File     : FOLIO404+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : weight comparison chain 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((heavier(X,Y) & heavier(Y,Z) => heavier(X,Z))) )).
fof(f0, axiom, ( heavier(alice,bob) )).
fof(f1, axiom, ( heavier(bob,charlie) )).
fof(f2, axiom, ( heavier(charlie,diana) )).
fof(goal, conjecture, ( heavier(alice,diana) )).
%------------------------------------------------------------------------------
