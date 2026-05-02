%------------------------------------------------------------------------------
% File     : PUZ002+1
% Domain   : Puzzles
% Problem  : Transitivity puzzle
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y,Z] : ((taller(X,Y) & taller(Y,Z) => taller(X,Z))) )).
fof(ax2, axiom, ( taller(alice,bob) )).
fof(ax3, axiom, ( taller(bob,charlie) )).
fof(goal, conjecture, ( taller(alice,charlie) )).
%------------------------------------------------------------------------------
