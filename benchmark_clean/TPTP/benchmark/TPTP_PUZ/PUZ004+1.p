%------------------------------------------------------------------------------
% File     : PUZ004+1
% Domain   : Puzzles
% Problem  : Knights and knaves basic
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : (knight(X) | knave(X)) )).
fof(ax2, axiom, ( ! [X] : (~(knight(X) & knave(X))) )).
fof(ax3, axiom, ( (knight(a) <=> knight(a)) )).
fof(goal, conjecture, ( knight(a) | knave(a) )).
%------------------------------------------------------------------------------
