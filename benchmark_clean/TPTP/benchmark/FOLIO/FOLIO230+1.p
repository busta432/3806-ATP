%------------------------------------------------------------------------------
% File     : FOLIO230+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Asymmetric older_than invalid reverse
% Status   : CounterSatisfiable
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(fact, axiom, ( older_than(alice,bob) )).
fof(goal, conjecture, ( older_than(bob,alice) )).
%------------------------------------------------------------------------------
