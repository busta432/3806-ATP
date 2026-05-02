%------------------------------------------------------------------------------
% File     : PUZ594+1
% Domain   : Puzzles
% Problem  : apple has property grows_on_plant
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => grows_on_plant(X))) )).
fof(is_cat, axiom, ( fruit(apple) )).
fof(goal, conjecture, ( grows_on_plant(apple) )).
%------------------------------------------------------------------------------
