%------------------------------------------------------------------------------
% File     : PUZ927+1
% Domain   : Puzzles
% Problem  : Binary tree depth 4 reachability
% Status   : Theorem
% Rating   : 0.40 v1.0.0
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
fof(c15, axiom, ( child(node7,node15) )).
fof(c16, axiom, ( child(node7,node16) )).
fof(c17, axiom, ( child(node8,node17) )).
fof(c18, axiom, ( child(node8,node18) )).
fof(c19, axiom, ( child(node9,node19) )).
fof(c20, axiom, ( child(node9,node20) )).
fof(c21, axiom, ( child(node10,node21) )).
fof(c22, axiom, ( child(node10,node22) )).
fof(c23, axiom, ( child(node11,node23) )).
fof(c24, axiom, ( child(node11,node24) )).
fof(c25, axiom, ( child(node12,node25) )).
fof(c26, axiom, ( child(node12,node26) )).
fof(c27, axiom, ( child(node13,node27) )).
fof(c28, axiom, ( child(node13,node28) )).
fof(c29, axiom, ( child(node14,node29) )).
fof(c30, axiom, ( child(node14,node30) )).
fof(goal, conjecture, ( reaches(node0,node30) )).
%------------------------------------------------------------------------------
