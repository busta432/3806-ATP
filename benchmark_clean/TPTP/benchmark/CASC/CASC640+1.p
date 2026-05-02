%------------------------------------------------------------------------------
% File     : CASC640+1
% Domain   : Competition (CASC-style)
% Problem  : Equality chain length 2
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq0, axiom, ( k0 = k1 )).
fof(eq1, axiom, ( k1 = k2 )).
fof(prop, axiom, ( p(k0) )).
fof(goal, conjecture, ( p(k2) )).
%------------------------------------------------------------------------------
