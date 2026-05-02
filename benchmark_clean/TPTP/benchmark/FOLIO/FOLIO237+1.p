%------------------------------------------------------------------------------
% File     : FOLIO237+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 3 athletes all trains
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((athlete(X) => trains(X))) )).
fof(e0, axiom, ( athlete(alice) )).
fof(e1, axiom, ( athlete(bob) )).
fof(e2, axiom, ( athlete(charlie) )).
fof(goal, conjecture, ( trains(alice) & trains(bob) & trains(charlie) )).
%------------------------------------------------------------------------------
