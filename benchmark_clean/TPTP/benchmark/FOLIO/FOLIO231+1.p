%------------------------------------------------------------------------------
% File     : FOLIO231+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Asymmetric teaches invalid reverse
% Status   : CounterSatisfiable
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(fact, axiom, ( teaches(alice,bob) )).
fof(goal, conjecture, ( teaches(bob,alice) )).
%------------------------------------------------------------------------------
