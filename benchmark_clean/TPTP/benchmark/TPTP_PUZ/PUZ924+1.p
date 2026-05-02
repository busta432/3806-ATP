%------------------------------------------------------------------------------
% File     : PUZ924+1
% Domain   : Puzzles
% Problem  : Cycle graph 15 nodes opposite connectivity
% Status   : Theorem
% Rating   : 0.55 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((path(X,Y) & path(Y,Z) => path(X,Z))) )).
fof(sym, axiom, ( ! [X,Y] : ((path(X,Y) => path(Y,X))) )).
fof(edge0, axiom, ( path(c0,c1) )).
fof(edge1, axiom, ( path(c1,c2) )).
fof(edge2, axiom, ( path(c2,c3) )).
fof(edge3, axiom, ( path(c3,c4) )).
fof(edge4, axiom, ( path(c4,c5) )).
fof(edge5, axiom, ( path(c5,c6) )).
fof(edge6, axiom, ( path(c6,c7) )).
fof(edge7, axiom, ( path(c7,c8) )).
fof(edge8, axiom, ( path(c8,c9) )).
fof(edge9, axiom, ( path(c9,c10) )).
fof(edge10, axiom, ( path(c10,c11) )).
fof(edge11, axiom, ( path(c11,c12) )).
fof(edge12, axiom, ( path(c12,c13) )).
fof(edge13, axiom, ( path(c13,c14) )).
fof(edge14, axiom, ( path(c14,c0) )).
fof(goal, conjecture, ( path(c0,c7) )).
%------------------------------------------------------------------------------
