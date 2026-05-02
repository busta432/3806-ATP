%------------------------------------------------------------------------------
% File     : CASC_INV003
% Domain   : Competition (CASC-style)
% Problem  : Invalid: universal from particular
% Status   : CounterSatisfiable
% Rating   : 0.10 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(a1, axiom, ( p(a) )).
fof(goal, conjecture, ( ! [X] : (p(X)) )).
%------------------------------------------------------------------------------
