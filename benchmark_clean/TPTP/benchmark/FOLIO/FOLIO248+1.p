%------------------------------------------------------------------------------
% File     : FOLIO248+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 2 artists all creates
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((artist(X) => creates(X))) )).
fof(e0, axiom, ( artist(alice) )).
fof(e1, axiom, ( artist(bob) )).
fof(goal, conjecture, ( creates(alice) & creates(bob) )).
%------------------------------------------------------------------------------
