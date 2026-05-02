%------------------------------------------------------------------------------
% File     : CASC649+1
% Domain   : Competition (CASC-style)
% Problem  : Equality chain length 11
% Status   : Theorem
% Rating   : 0.44 v1.0.0
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
fof(eq7, axiom, ( k7 = k8 )).
fof(eq8, axiom, ( k8 = k9 )).
fof(eq9, axiom, ( k9 = k10 )).
fof(eq10, axiom, ( k10 = k11 )).
fof(prop, axiom, ( p(k0) )).
fof(goal, conjecture, ( p(k11) )).
%------------------------------------------------------------------------------
