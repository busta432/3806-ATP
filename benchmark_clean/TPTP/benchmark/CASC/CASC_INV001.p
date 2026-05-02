%------------------------------------------------------------------------------
% File     : CASC_INV001
% Domain   : Competition (CASC-style)
% Problem  : Invalid: non-transitive
% Status   : CounterSatisfiable
% Rating   : 0.20 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(a1, axiom, ( rel(a,b) )).
fof(a2, axiom, ( rel(b,c) )).
fof(goal, conjecture, ( rel(a,c) )).
%------------------------------------------------------------------------------
