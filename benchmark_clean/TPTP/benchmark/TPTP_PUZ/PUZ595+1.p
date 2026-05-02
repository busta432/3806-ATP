%------------------------------------------------------------------------------
% File     : PUZ595+1
% Domain   : Puzzles
% Problem  : banana has property grows_on_plant
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => grows_on_plant(X))) )).
fof(is_cat, axiom, ( fruit(banana) )).
fof(goal, conjecture, ( grows_on_plant(banana) )).
%------------------------------------------------------------------------------
