%------------------------------------------------------------------------------
% File     : PUZ005+1
% Domain   : Puzzles
% Problem  : Knights: A says B is knight
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : (knight(X) | knave(X)) )).
fof(ax2, axiom, ( ! [X] : (~(knight(X) & knave(X))) )).
fof(ax3, axiom, ( (knight(a) <=> knight(b)) )).
fof(goal, conjecture, ( (knight(a) & knight(b)) | (knave(a) & knave(b)) )).
%------------------------------------------------------------------------------
