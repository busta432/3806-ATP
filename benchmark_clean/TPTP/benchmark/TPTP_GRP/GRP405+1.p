%------------------------------------------------------------------------------
% File     : GRP405+1
% Domain   : Group Theory
% Problem  : Normal subgroup conjugation 6 elements
% Status   : Theorem
% Rating   : 0.65 v1.0.0
% Source   : [GRP]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(closure, axiom, ( ! [X,Y] : (? [Z] : (product(X,Y,Z))) )).
fof(func, axiom, ( ! [X,Y,Z1,Z2] : ((product(X,Y,Z1) & product(X,Y,Z2) => Z1 = Z2)) )).
fof(assoc, axiom, ( ! [X,Y,Z,XY,YZ,R1,R2] : ((product(X,Y,XY) & product(Y,Z,YZ) & product(XY,Z,R1) & product(X,YZ,R2) => R1 = R2)) )).
fof(lid, axiom, ( ! [X] : (product(e,X,X)) )).
fof(rid, axiom, ( ! [X] : (product(X,e,X)) )).
fof(linv, axiom, ( ! [X] : (? [Y] : (product(Y,X,e))) )).
fof(rinv, axiom, ( ! [X] : (? [Y] : (product(X,Y,e))) )).
fof(norm, axiom, ( ! [G,H,GH,HI] : ((normal(H) & product(G,H,GH) => ? [H2] : (normal(H2) & product(H2,G,GH)))) )).
fof(n0, axiom, ( normal(h0) )).
fof(n1, axiom, ( normal(h1) )).
fof(n2, axiom, ( normal(h2) )).
fof(n3, axiom, ( normal(h3) )).
fof(n4, axiom, ( normal(h4) )).
fof(n5, axiom, ( normal(h5) )).
fof(prod_h, axiom, ( product(g0,h0,r0) )).
fof(goal, conjecture, ( ? [H2] : (normal(H2) & product(H2,g0,r0)) )).
%------------------------------------------------------------------------------
