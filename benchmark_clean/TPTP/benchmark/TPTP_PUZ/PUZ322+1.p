%------------------------------------------------------------------------------
% File     : PUZ322+1
% Domain   : Puzzles
% Problem  : Classification pine is organism
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((tree(X) => plant(X))) )).
fof(mid_top, axiom, ( ! [X] : ((plant(X) => organism(X))) )).
fof(inst, axiom, ( tree(pine) )).
fof(goal, conjecture, ( organism(pine) )).
%------------------------------------------------------------------------------
