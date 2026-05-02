%------------------------------------------------------------------------------
% File     : CASC_REL001
% Domain   : Competition (CASC-style)
% Problem  : Equivalence relation
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(refl, axiom, ( ! [X] : (r(X,X)) )).
fof(sym, axiom, ( ! [X,Y] : ((r(X,Y) => r(Y,X))) )).
fof(trans, axiom, ( ! [X,Y,Z] : ((r(X,Y) & r(Y,Z) => r(X,Z))) )).
fof(a1, axiom, ( r(a,b) )).
fof(goal, conjecture, ( r(b,a) & r(a,a) & r(b,b) )).
%------------------------------------------------------------------------------
