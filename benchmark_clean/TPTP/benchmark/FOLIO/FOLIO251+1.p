%------------------------------------------------------------------------------
% File     : FOLIO251+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 5 artists all creates
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((artist(X) => creates(X))) )).
fof(e0, axiom, ( artist(alice) )).
fof(e1, axiom, ( artist(bob) )).
fof(e2, axiom, ( artist(charlie) )).
fof(e3, axiom, ( artist(diana) )).
fof(e4, axiom, ( artist(eve) )).
fof(goal, conjecture, ( creates(alice) & creates(bob) & creates(charlie) & creates(diana) & creates(eve) )).
%------------------------------------------------------------------------------
