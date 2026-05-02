%------------------------------------------------------------------------------
% File     : CASC904+1
% Domain   : Competition (CASC-style)
% Problem  : entails chain 4
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((entails(X,Y) & entails(Y,Z) => entails(X,Z))) )).
fof(e0, axiom, ( entails(x0,x1) )).
fof(e1, axiom, ( entails(x1,x2) )).
fof(e2, axiom, ( entails(x2,x3) )).
fof(e3, axiom, ( entails(x3,x4) )).
fof(goal, conjecture, ( entails(x0,x4) )).
%------------------------------------------------------------------------------
