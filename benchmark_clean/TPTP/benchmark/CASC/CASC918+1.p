%------------------------------------------------------------------------------
% File     : CASC918+1
% Domain   : Competition (CASC-style)
% Problem  : entails chain 18
% Status   : Theorem
% Rating   : 0.54 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((entails(X,Y) & entails(Y,Z) => entails(X,Z))) )).
fof(e0, axiom, ( entails(x0,x1) )).
fof(e1, axiom, ( entails(x1,x2) )).
fof(e2, axiom, ( entails(x2,x3) )).
fof(e3, axiom, ( entails(x3,x4) )).
fof(e4, axiom, ( entails(x4,x5) )).
fof(e5, axiom, ( entails(x5,x6) )).
fof(e6, axiom, ( entails(x6,x7) )).
fof(e7, axiom, ( entails(x7,x8) )).
fof(e8, axiom, ( entails(x8,x9) )).
fof(e9, axiom, ( entails(x9,x10) )).
fof(e10, axiom, ( entails(x10,x11) )).
fof(e11, axiom, ( entails(x11,x12) )).
fof(e12, axiom, ( entails(x12,x13) )).
fof(e13, axiom, ( entails(x13,x14) )).
fof(e14, axiom, ( entails(x14,x15) )).
fof(e15, axiom, ( entails(x15,x16) )).
fof(e16, axiom, ( entails(x16,x17) )).
fof(e17, axiom, ( entails(x17,x18) )).
fof(goal, conjecture, ( entails(x0,x18) )).
%------------------------------------------------------------------------------
