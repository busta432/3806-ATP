%------------------------------------------------------------------------------
% File     : FOLIO249+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 3 artists all creates
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((artist(X) => creates(X))) )).
fof(e0, axiom, ( artist(alice) )).
fof(e1, axiom, ( artist(bob) )).
fof(e2, axiom, ( artist(charlie) )).
fof(goal, conjecture, ( creates(alice) & creates(bob) & creates(charlie) )).
%------------------------------------------------------------------------------
