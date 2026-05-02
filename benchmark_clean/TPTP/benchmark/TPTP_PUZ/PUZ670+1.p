%------------------------------------------------------------------------------
% File     : PUZ670+1
% Domain   : Puzzles
% Problem  : flute has property is_artifact
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((instrument(X) => is_artifact(X))) )).
fof(is_cat, axiom, ( instrument(flute) )).
fof(goal, conjecture, ( is_artifact(flute) )).
%------------------------------------------------------------------------------
