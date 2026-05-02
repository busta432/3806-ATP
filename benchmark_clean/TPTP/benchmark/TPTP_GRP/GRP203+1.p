%------------------------------------------------------------------------------
% File     : GRP203+1
% Domain   : Group Theory
% Problem  : Semigroup associativity instance 3
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [GRP]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(assoc, axiom, ( ! [X,Y,Z] : (mult(mult(X,Y),Z) = mult(X,mult(Y,Z))) )).
fof(ax1, axiom, ( mult(a0,a1) = a2 )).
fof(ax2, axiom, ( mult(a1,a2) = a3 )).
fof(ax3, axiom, ( p(a2) )).
fof(goal, conjecture, ( mult(mult(a0,a1),a2) = mult(a0,mult(a1,a2)) )).
%------------------------------------------------------------------------------
