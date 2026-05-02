%------------------------------------------------------------------------------
% File     : PUZ667+1
% Domain   : Puzzles
% Problem  : piano has property is_artifact
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((instrument(X) => is_artifact(X))) )).
fof(is_cat, axiom, ( instrument(piano) )).
fof(goal, conjecture, ( is_artifact(piano) )).
%------------------------------------------------------------------------------
