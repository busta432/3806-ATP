%------------------------------------------------------------------------------
% File     : PUZ635+1
% Domain   : Puzzles
% Problem  : dog has property is_organism
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => is_organism(X))) )).
fof(is_cat, axiom, ( animal(dog) )).
fof(goal, conjecture, ( is_organism(dog) )).
%------------------------------------------------------------------------------
