%------------------------------------------------------------------------------
% File     : PUZ508+1
% Domain   : Puzzles
% Problem  : Family ancestor chain length 9
% Status   : Theorem
% Rating   : 0.36 v1.0.0
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
fof(f7, axiom, ( parent(grace,henry) )).
fof(f8, axiom, ( parent(henry,iris) )).
fof(f9, axiom, ( parent(iris,jack) )).
fof(goal, conjecture, ( ancestor(alice,jack) )).
%------------------------------------------------------------------------------
