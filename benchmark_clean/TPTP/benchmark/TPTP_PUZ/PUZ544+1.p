%------------------------------------------------------------------------------
% File     : PUZ544+1
% Domain   : Puzzles
% Problem  : Task scheduling 10 sequential tasks
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((before(X,Y) & before(Y,Z) => before(X,Z))) )).
fof(ord0, axiom, ( before(task0,task1) )).
fof(ord1, axiom, ( before(task1,task2) )).
fof(ord2, axiom, ( before(task2,task3) )).
fof(ord3, axiom, ( before(task3,task4) )).
fof(ord4, axiom, ( before(task4,task5) )).
fof(ord5, axiom, ( before(task5,task6) )).
fof(ord6, axiom, ( before(task6,task7) )).
fof(ord7, axiom, ( before(task7,task8) )).
fof(ord8, axiom, ( before(task8,task9) )).
fof(goal, conjecture, ( before(task0,task9) )).
%------------------------------------------------------------------------------
