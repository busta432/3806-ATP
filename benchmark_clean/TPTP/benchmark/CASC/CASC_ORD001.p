%------------------------------------------------------------------------------
% File     : CASC_ORD001
% Domain   : Competition (CASC-style)
% Problem  : Partial order transitivity
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(refl, axiom, ( ! [X] : (leq(X,X)) )).
fof(antisym, axiom, ( ! [X,Y] : ((leq(X,Y) & leq(Y,X) => X = Y)) )).
fof(trans, axiom, ( ! [X,Y,Z] : ((leq(X,Y) & leq(Y,Z) => leq(X,Z))) )).
fof(a1, axiom, ( leq(a,b) )).
fof(a2, axiom, ( leq(b,c) )).
fof(goal, conjecture, ( leq(a,c) )).
%------------------------------------------------------------------------------
