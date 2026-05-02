%------------------------------------------------------------------------------
% File     : PUZ903+1
% Domain   : Puzzles
% Problem  : Star graph 5 leaves connectivity
% Status   : Theorem
% Rating   : 0.30 v1.0.0
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
fof(goal, conjecture, ( conn(leaf0,leaf4) )).
%------------------------------------------------------------------------------
