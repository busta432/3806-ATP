%------------------------------------------------------------------------------
% File     : FOLIO236+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 2 athletes all trains
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((athlete(X) => trains(X))) )).
fof(e0, axiom, ( athlete(alice) )).
fof(e1, axiom, ( athlete(bob) )).
fof(goal, conjecture, ( trains(alice) & trains(bob) )).
%------------------------------------------------------------------------------
