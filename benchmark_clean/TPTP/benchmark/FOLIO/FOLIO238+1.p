%------------------------------------------------------------------------------
% File     : FOLIO238+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 4 athletes all trains
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((athlete(X) => trains(X))) )).
fof(e0, axiom, ( athlete(alice) )).
fof(e1, axiom, ( athlete(bob) )).
fof(e2, axiom, ( athlete(charlie) )).
fof(e3, axiom, ( athlete(diana) )).
fof(goal, conjecture, ( trains(alice) & trains(bob) & trains(charlie) & trains(diana) )).
%------------------------------------------------------------------------------
