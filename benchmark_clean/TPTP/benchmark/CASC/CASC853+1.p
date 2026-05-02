%------------------------------------------------------------------------------
% File     : CASC853+1
% Domain   : Competition (CASC-style)
% Problem  : precedes chain 4
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((precedes(X,Y) & precedes(Y,Z) => precedes(X,Z))) )).
fof(e0, axiom, ( precedes(x0,x1) )).
fof(e1, axiom, ( precedes(x1,x2) )).
fof(e2, axiom, ( precedes(x2,x3) )).
fof(e3, axiom, ( precedes(x3,x4) )).
fof(goal, conjecture, ( precedes(x0,x4) )).
%------------------------------------------------------------------------------
