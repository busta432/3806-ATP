%------------------------------------------------------------------------------
% File     : PUZ659+1
% Domain   : Puzzles
% Problem  : piano has property is_musical
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((instrument(X) => is_musical(X))) )).
fof(is_cat, axiom, ( instrument(piano) )).
fof(goal, conjecture, ( is_musical(piano) )).
%------------------------------------------------------------------------------
