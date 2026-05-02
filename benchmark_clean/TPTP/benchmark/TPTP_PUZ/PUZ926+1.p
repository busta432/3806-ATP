%------------------------------------------------------------------------------
% File     : PUZ926+1
% Domain   : Puzzles
% Problem  : Binary tree depth 3 reachability
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((reaches(X,Y) & reaches(Y,Z) => reaches(X,Z))) )).
fof(base_r, axiom, ( ! [X,Y] : ((child(X,Y) => reaches(X,Y))) )).
fof(c1, axiom, ( child(node0,node1) )).
fof(c2, axiom, ( child(node0,node2) )).
fof(c3, axiom, ( child(node1,node3) )).
fof(c4, axiom, ( child(node1,node4) )).
fof(c5, axiom, ( child(node2,node5) )).
fof(c6, axiom, ( child(node2,node6) )).
fof(c7, axiom, ( child(node3,node7) )).
fof(c8, axiom, ( child(node3,node8) )).
fof(c9, axiom, ( child(node4,node9) )).
fof(c10, axiom, ( child(node4,node10) )).
fof(c11, axiom, ( child(node5,node11) )).
fof(c12, axiom, ( child(node5,node12) )).
fof(c13, axiom, ( child(node6,node13) )).
fof(c14, axiom, ( child(node6,node14) )).
fof(goal, conjecture, ( reaches(node0,node14) )).
%------------------------------------------------------------------------------
