%------------------------------------------------------------------------------
% File     : PUZ505+1
% Domain   : Puzzles
% Problem  : Family ancestor chain length 6
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(base_r, axiom, ( ! [X,Y] : ((parent(X,Y) => ancestor(X,Y))) )).
fof(trans_r, axiom, ( ! [X,Y,Z] : ((ancestor(X,Y) & ancestor(Y,Z) => ancestor(X,Z))) )).
fof(f1, axiom, ( parent(alice,bob) )).
fof(f2, axiom, ( parent(bob,charlie) )).
fof(f3, axiom, ( parent(charlie,diana) )).
fof(f4, axiom, ( parent(diana,eve) )).
fof(f5, axiom, ( parent(eve,frank) )).
fof(f6, axiom, ( parent(frank,grace) )).
fof(goal, conjecture, ( ancestor(alice,grace) )).
%------------------------------------------------------------------------------
