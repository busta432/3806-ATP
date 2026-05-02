%------------------------------------------------------------------------------
% File     : PUZ580+1
% Domain   : Puzzles
% Problem  : cherry has property is_edible
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => is_edible(X))) )).
fof(is_cat, axiom, ( fruit(cherry) )).
fof(goal, conjecture, ( is_edible(cherry) )).
%------------------------------------------------------------------------------
