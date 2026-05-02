%------------------------------------------------------------------------------
% File     : GRP207+1
% Domain   : Group Theory
% Problem  : Semigroup associativity instance 7
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [GRP]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(assoc, axiom, ( ! [X,Y,Z] : (mult(mult(X,Y),Z) = mult(X,mult(Y,Z))) )).
fof(ax1, axiom, ( mult(a0,a1) = a2 )).
fof(ax2, axiom, ( mult(a1,a2) = a3 )).
fof(ax3, axiom, ( mult(a2,a3) = a4 )).
fof(ax4, axiom, ( mult(a3,a4) = a5 )).
fof(ax5, axiom, ( mult(a4,a5) = a6 )).
fof(ax6, axiom, ( mult(a5,a6) = a7 )).
fof(ax7, axiom, ( p(a6) )).
fof(goal, conjecture, ( mult(mult(a0,a1),a2) = mult(a0,mult(a1,a2)) )).
%------------------------------------------------------------------------------
