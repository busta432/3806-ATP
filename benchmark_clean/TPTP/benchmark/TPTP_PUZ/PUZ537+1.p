%------------------------------------------------------------------------------
% File     : PUZ537+1
% Domain   : Puzzles
% Problem  : Task scheduling 3 sequential tasks
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((before(X,Y) & before(Y,Z) => before(X,Z))) )).
fof(ord0, axiom, ( before(task0,task1) )).
fof(ord1, axiom, ( before(task1,task2) )).
fof(goal, conjecture, ( before(task0,task2) )).
%------------------------------------------------------------------------------
