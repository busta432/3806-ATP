%------------------------------------------------------------------------------
% File     : PUZ925+1
% Domain   : Puzzles
% Problem  : Binary tree depth 2 reachability
% Status   : Theorem
% Rating   : 0.20 v1.0.0
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
fof(goal, conjecture, ( reaches(node0,node6) )).
%------------------------------------------------------------------------------
