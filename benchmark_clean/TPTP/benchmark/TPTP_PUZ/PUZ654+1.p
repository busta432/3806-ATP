%------------------------------------------------------------------------------
% File     : PUZ654+1
% Domain   : Puzzles
% Problem  : flute has property needs_player
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((instrument(X) => needs_player(X))) )).
fof(is_cat, axiom, ( instrument(flute) )).
fof(goal, conjecture, ( needs_player(flute) )).
%------------------------------------------------------------------------------
