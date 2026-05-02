%------------------------------------------------------------------------------
% File     : FOLIO229+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Asymmetric parent_of invalid reverse
% Status   : CounterSatisfiable
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(fact, axiom, ( parent_of(alice,bob) )).
fof(goal, conjecture, ( parent_of(bob,alice) )).
%------------------------------------------------------------------------------
