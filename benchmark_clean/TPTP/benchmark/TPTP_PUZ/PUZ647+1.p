%------------------------------------------------------------------------------
% File     : PUZ647+1
% Domain   : Puzzles
% Problem  : trumpet has property makes_sound
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((instrument(X) => makes_sound(X))) )).
fof(is_cat, axiom, ( instrument(trumpet) )).
fof(goal, conjecture, ( makes_sound(trumpet) )).
%------------------------------------------------------------------------------
