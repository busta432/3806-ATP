%------------------------------------------------------------------------------
% File     : PUZ006+1
% Domain   : Puzzles
% Problem  : Wolf goat cabbage safety
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [S] : ((alone(wolf,goat,S) => eats(wolf,goat,S))) )).
fof(ax2, axiom, ( ! [X,Y,S] : ((eats(X,Y,S) => unsafe(S))) )).
fof(ax3, axiom, ( alone(wolf,goat,s0) )).
fof(goal, conjecture, ( unsafe(s0) )).
%------------------------------------------------------------------------------
