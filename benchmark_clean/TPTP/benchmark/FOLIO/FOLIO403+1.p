%------------------------------------------------------------------------------
% File     : FOLIO403+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : speed comparison chain 5
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((faster(X,Y) & faster(Y,Z) => faster(X,Z))) )).
fof(f0, axiom, ( faster(alice,bob) )).
fof(f1, axiom, ( faster(bob,charlie) )).
fof(f2, axiom, ( faster(charlie,diana) )).
fof(f3, axiom, ( faster(diana,eve) )).
fof(f4, axiom, ( faster(eve,frank) )).
fof(goal, conjecture, ( faster(alice,frank) )).
%------------------------------------------------------------------------------
