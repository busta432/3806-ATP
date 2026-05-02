%------------------------------------------------------------------------------
% File     : CASC_REL002
% Domain   : Competition (CASC-style)
% Problem  : Functional relation uniqueness
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(func, axiom, ( ! [X,Y,Z] : ((f_rel(X,Y) & f_rel(X,Z) => Y = Z)) )).
fof(a1, axiom, ( f_rel(a,b) )).
fof(a2, axiom, ( f_rel(a,c) )).
fof(goal, conjecture, ( b = c )).
%------------------------------------------------------------------------------
