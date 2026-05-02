%------------------------------------------------------------------------------
% File     : CASC_ORD002
% Domain   : Competition (CASC-style)
% Problem  : Antisymmetry implies equality
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(refl, axiom, ( ! [X] : (leq(X,X)) )).
fof(antisym, axiom, ( ! [X,Y] : ((leq(X,Y) & leq(Y,X) => X = Y)) )).
fof(trans, axiom, ( ! [X,Y,Z] : ((leq(X,Y) & leq(Y,Z) => leq(X,Z))) )).
fof(a1, axiom, ( leq(a,b) )).
fof(a2, axiom, ( leq(b,a) )).
fof(goal, conjecture, ( a = b )).
%------------------------------------------------------------------------------
