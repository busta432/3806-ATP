%------------------------------------------------------------------------------
% File     : CASC641+1
% Domain   : Competition (CASC-style)
% Problem  : Equality chain length 3
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq0, axiom, ( k0 = k1 )).
fof(eq1, axiom, ( k1 = k2 )).
fof(eq2, axiom, ( k2 = k3 )).
fof(prop, axiom, ( p(k0) )).
fof(goal, conjecture, ( p(k3) )).
%------------------------------------------------------------------------------
