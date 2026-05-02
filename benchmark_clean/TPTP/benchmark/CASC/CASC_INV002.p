%------------------------------------------------------------------------------
% File     : CASC_INV002
% Domain   : Competition (CASC-style)
% Problem  : Invalid: symmetry
% Status   : CounterSatisfiable
% Rating   : 0.15 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(a1, axiom, ( rel(a,b) )).
fof(goal, conjecture, ( rel(b,a) )).
%------------------------------------------------------------------------------
