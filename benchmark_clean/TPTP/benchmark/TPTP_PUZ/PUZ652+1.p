%------------------------------------------------------------------------------
% File     : PUZ652+1
% Domain   : Puzzles
% Problem  : violin has property needs_player
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((instrument(X) => needs_player(X))) )).
fof(is_cat, axiom, ( instrument(violin) )).
fof(goal, conjecture, ( needs_player(violin) )).
%------------------------------------------------------------------------------
