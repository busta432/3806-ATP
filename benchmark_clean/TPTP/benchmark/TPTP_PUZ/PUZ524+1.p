%------------------------------------------------------------------------------
% File     : PUZ524+1
% Domain   : Puzzles
% Problem  : Family relative chain length 9
% Status   : Theorem
% Rating   : 0.36 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(base_r, axiom, ( ! [X,Y] : ((sibling(X,Y) => relative(X,Y))) )).
fof(trans_r, axiom, ( ! [X,Y,Z] : ((relative(X,Y) & relative(Y,Z) => relative(X,Z))) )).
fof(f1, axiom, ( sibling(alice,bob) )).
fof(f2, axiom, ( sibling(bob,charlie) )).
fof(f3, axiom, ( sibling(charlie,diana) )).
fof(f4, axiom, ( sibling(diana,eve) )).
fof(f5, axiom, ( sibling(eve,frank) )).
fof(f6, axiom, ( sibling(frank,grace) )).
fof(f7, axiom, ( sibling(grace,henry) )).
fof(f8, axiom, ( sibling(henry,iris) )).
fof(f9, axiom, ( sibling(iris,jack) )).
fof(goal, conjecture, ( relative(alice,jack) )).
%------------------------------------------------------------------------------
