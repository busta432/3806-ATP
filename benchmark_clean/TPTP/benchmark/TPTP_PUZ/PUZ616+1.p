%------------------------------------------------------------------------------
% File     : PUZ616+1
% Domain   : Puzzles
% Problem  : hamster has property is_living
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => is_living(X))) )).
fof(is_cat, axiom, ( animal(hamster) )).
fof(goal, conjecture, ( is_living(hamster) )).
%------------------------------------------------------------------------------
