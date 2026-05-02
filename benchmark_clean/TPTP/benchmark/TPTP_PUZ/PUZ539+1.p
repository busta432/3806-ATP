%------------------------------------------------------------------------------
% File     : PUZ539+1
% Domain   : Puzzles
% Problem  : Task scheduling 5 sequential tasks
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((before(X,Y) & before(Y,Z) => before(X,Z))) )).
fof(ord0, axiom, ( before(task0,task1) )).
fof(ord1, axiom, ( before(task1,task2) )).
fof(ord2, axiom, ( before(task2,task3) )).
fof(ord3, axiom, ( before(task3,task4) )).
fof(goal, conjecture, ( before(task0,task4) )).
%------------------------------------------------------------------------------
