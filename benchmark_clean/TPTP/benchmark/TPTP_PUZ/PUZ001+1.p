%------------------------------------------------------------------------------
% File     : PUZ001+1
% Domain   : Puzzles
% Problem  : Socrates syllogism
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((human(X) => mortal(X))) )).
fof(ax2, axiom, ( human(socrates) )).
fof(goal, conjecture, ( mortal(socrates) )).
%------------------------------------------------------------------------------
