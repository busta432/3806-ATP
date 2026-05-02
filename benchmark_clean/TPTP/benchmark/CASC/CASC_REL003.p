%------------------------------------------------------------------------------
% File     : CASC_REL003
% Domain   : Competition (CASC-style)
% Problem  : Injectivity
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(inj, axiom, ( ! [X,Y,Z] : ((f_rel(X,Z) & f_rel(Y,Z) => X = Y)) )).
fof(a1, axiom, ( f_rel(a,c) )).
fof(a2, axiom, ( f_rel(b,c) )).
fof(goal, conjecture, ( a = b )).
%------------------------------------------------------------------------------
