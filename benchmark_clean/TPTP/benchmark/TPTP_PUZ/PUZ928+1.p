%------------------------------------------------------------------------------
% File     : PUZ928+1
% Domain   : Puzzles
% Problem  : Binary tree depth 5 reachability
% Status   : Theorem
% Rating   : 0.50 v1.0.0
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
fof(c31, axiom, ( child(node15,node31) )).
fof(c32, axiom, ( child(node15,node32) )).
fof(c33, axiom, ( child(node16,node33) )).
fof(c34, axiom, ( child(node16,node34) )).
fof(c35, axiom, ( child(node17,node35) )).
fof(c36, axiom, ( child(node17,node36) )).
fof(c37, axiom, ( child(node18,node37) )).
fof(c38, axiom, ( child(node18,node38) )).
fof(c39, axiom, ( child(node19,node39) )).
fof(c40, axiom, ( child(node19,node40) )).
fof(c41, axiom, ( child(node20,node41) )).
fof(c42, axiom, ( child(node20,node42) )).
fof(c43, axiom, ( child(node21,node43) )).
fof(c44, axiom, ( child(node21,node44) )).
fof(c45, axiom, ( child(node22,node45) )).
fof(c46, axiom, ( child(node22,node46) )).
fof(c47, axiom, ( child(node23,node47) )).
fof(c48, axiom, ( child(node23,node48) )).
fof(c49, axiom, ( child(node24,node49) )).
fof(c50, axiom, ( child(node24,node50) )).
fof(c51, axiom, ( child(node25,node51) )).
fof(c52, axiom, ( child(node25,node52) )).
fof(c53, axiom, ( child(node26,node53) )).
fof(c54, axiom, ( child(node26,node54) )).
fof(c55, axiom, ( child(node27,node55) )).
fof(c56, axiom, ( child(node27,node56) )).
fof(c57, axiom, ( child(node28,node57) )).
fof(c58, axiom, ( child(node28,node58) )).
fof(c59, axiom, ( child(node29,node59) )).
fof(c60, axiom, ( child(node29,node60) )).
fof(c61, axiom, ( child(node30,node61) )).
fof(c62, axiom, ( child(node30,node62) )).
fof(goal, conjecture, ( reaches(node0,node62) )).
%------------------------------------------------------------------------------
