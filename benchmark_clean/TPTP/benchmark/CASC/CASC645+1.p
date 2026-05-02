%------------------------------------------------------------------------------
% File     : CASC645+1
% Domain   : Competition (CASC-style)
% Problem  : Equality chain length 7
% Status   : Theorem
% Rating   : 0.28 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq0, axiom, ( k0 = k1 )).
fof(eq1, axiom, ( k1 = k2 )).
fof(eq2, axiom, ( k2 = k3 )).
fof(eq3, axiom, ( k3 = k4 )).
fof(eq4, axiom, ( k4 = k5 )).
fof(eq5, axiom, ( k5 = k6 )).
fof(eq6, axiom, ( k6 = k7 )).
fof(prop, axiom, ( p(k0) )).
fof(goal, conjecture, ( p(k7) )).
%------------------------------------------------------------------------------
