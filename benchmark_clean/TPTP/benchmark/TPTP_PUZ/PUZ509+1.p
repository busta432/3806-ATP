%------------------------------------------------------------------------------
% File     : PUZ509+1
% Domain   : Puzzles
% Problem  : Family descendant chain length 2
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(base_r, axiom, ( ! [X,Y] : ((child(X,Y) => descendant(X,Y))) )).
fof(trans_r, axiom, ( ! [X,Y,Z] : ((descendant(X,Y) & descendant(Y,Z) => descendant(X,Z))) )).
fof(f1, axiom, ( child(alice,bob) )).
fof(f2, axiom, ( child(bob,charlie) )).
fof(goal, conjecture, ( descendant(alice,charlie) )).
%------------------------------------------------------------------------------
