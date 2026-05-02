%------------------------------------------------------------------------------
% File     : PUZ520+1
% Domain   : Puzzles
% Problem  : Family relative chain length 5
% Status   : Theorem
% Rating   : 0.20 v1.0.0
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
fof(goal, conjecture, ( relative(alice,frank) )).
%------------------------------------------------------------------------------
