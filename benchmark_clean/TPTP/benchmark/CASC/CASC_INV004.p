%------------------------------------------------------------------------------
% File     : CASC_INV004
% Domain   : Competition (CASC-style)
% Problem  : Invalid: conj from disj
% Status   : CounterSatisfiable
% Rating   : 0.10 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(a1, axiom, ( p(a) | q(a) )).
fof(goal, conjecture, ( p(a) & q(a) )).
%------------------------------------------------------------------------------
