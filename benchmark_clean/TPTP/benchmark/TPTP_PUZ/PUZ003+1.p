%------------------------------------------------------------------------------
% File     : PUZ003+1
% Domain   : Puzzles
% Problem  : Ancestral relation
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y] : ((parent(X,Y) => ancestor(X,Y))) )).
fof(ax2, axiom, ( ! [X,Y,Z] : ((ancestor(X,Y) & ancestor(Y,Z) => ancestor(X,Z))) )).
fof(ax3, axiom, ( parent(a,b) )).
fof(ax4, axiom, ( parent(b,c) )).
fof(goal, conjecture, ( ancestor(a,c) )).
%------------------------------------------------------------------------------
