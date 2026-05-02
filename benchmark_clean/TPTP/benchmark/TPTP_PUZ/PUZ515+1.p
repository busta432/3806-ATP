%------------------------------------------------------------------------------
% File     : PUZ515+1
% Domain   : Puzzles
% Problem  : Family descendant chain length 8
% Status   : Theorem
% Rating   : 0.32 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(base_r, axiom, ( ! [X,Y] : ((child(X,Y) => descendant(X,Y))) )).
fof(trans_r, axiom, ( ! [X,Y,Z] : ((descendant(X,Y) & descendant(Y,Z) => descendant(X,Z))) )).
fof(f1, axiom, ( child(alice,bob) )).
fof(f2, axiom, ( child(bob,charlie) )).
fof(f3, axiom, ( child(charlie,diana) )).
fof(f4, axiom, ( child(diana,eve) )).
fof(f5, axiom, ( child(eve,frank) )).
fof(f6, axiom, ( child(frank,grace) )).
fof(f7, axiom, ( child(grace,henry) )).
fof(f8, axiom, ( child(henry,iris) )).
fof(goal, conjecture, ( descendant(alice,iris) )).
%------------------------------------------------------------------------------
