%------------------------------------------------------------------------------
% File     : PUZ599+1
% Domain   : Puzzles
% Problem  : fig has property grows_on_plant
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => grows_on_plant(X))) )).
fof(is_cat, axiom, ( fruit(fig) )).
fof(goal, conjecture, ( grows_on_plant(fig) )).
%------------------------------------------------------------------------------
