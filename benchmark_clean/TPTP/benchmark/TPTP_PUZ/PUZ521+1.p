%------------------------------------------------------------------------------
% File     : PUZ521+1
% Domain   : Puzzles
% Problem  : Family relative chain length 6
% Status   : Theorem
% Rating   : 0.24 v1.0.0
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
fof(goal, conjecture, ( relative(alice,grace) )).
%------------------------------------------------------------------------------
