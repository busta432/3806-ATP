%------------------------------------------------------------------------------
% File     : CASC859+1
% Domain   : Competition (CASC-style)
% Problem  : precedes chain 10
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((precedes(X,Y) & precedes(Y,Z) => precedes(X,Z))) )).
fof(e0, axiom, ( precedes(x0,x1) )).
fof(e1, axiom, ( precedes(x1,x2) )).
fof(e2, axiom, ( precedes(x2,x3) )).
fof(e3, axiom, ( precedes(x3,x4) )).
fof(e4, axiom, ( precedes(x4,x5) )).
fof(e5, axiom, ( precedes(x5,x6) )).
fof(e6, axiom, ( precedes(x6,x7) )).
fof(e7, axiom, ( precedes(x7,x8) )).
fof(e8, axiom, ( precedes(x8,x9) )).
fof(e9, axiom, ( precedes(x9,x10) )).
fof(goal, conjecture, ( precedes(x0,x10) )).
%------------------------------------------------------------------------------
