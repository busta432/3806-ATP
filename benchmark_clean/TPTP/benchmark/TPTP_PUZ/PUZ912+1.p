%------------------------------------------------------------------------------
% File     : PUZ912+1
% Domain   : Puzzles
% Problem  : Star graph 14 leaves connectivity
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((conn(X,Y) & conn(Y,Z) => conn(X,Z))) )).
fof(sym, axiom, ( ! [X,Y] : ((conn(X,Y) => conn(Y,X))) )).
fof(spoke0, axiom, ( conn(center,leaf0) )).
fof(spoke1, axiom, ( conn(center,leaf1) )).
fof(spoke2, axiom, ( conn(center,leaf2) )).
fof(spoke3, axiom, ( conn(center,leaf3) )).
fof(spoke4, axiom, ( conn(center,leaf4) )).
fof(spoke5, axiom, ( conn(center,leaf5) )).
fof(spoke6, axiom, ( conn(center,leaf6) )).
fof(spoke7, axiom, ( conn(center,leaf7) )).
fof(spoke8, axiom, ( conn(center,leaf8) )).
fof(spoke9, axiom, ( conn(center,leaf9) )).
fof(spoke10, axiom, ( conn(center,leaf10) )).
fof(spoke11, axiom, ( conn(center,leaf11) )).
fof(spoke12, axiom, ( conn(center,leaf12) )).
fof(spoke13, axiom, ( conn(center,leaf13) )).
fof(goal, conjecture, ( conn(leaf0,leaf13) )).
%------------------------------------------------------------------------------
