%------------------------------------------------------------------------------
% File     : CASC838+1
% Domain   : Competition (CASC-style)
% Problem  : dominates chain 6
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((dominates(X,Y) & dominates(Y,Z) => dominates(X,Z))) )).
fof(e0, axiom, ( dominates(x0,x1) )).
fof(e1, axiom, ( dominates(x1,x2) )).
fof(e2, axiom, ( dominates(x2,x3) )).
fof(e3, axiom, ( dominates(x3,x4) )).
fof(e4, axiom, ( dominates(x4,x5) )).
fof(e5, axiom, ( dominates(x5,x6) )).
fof(goal, conjecture, ( dominates(x0,x6) )).
%------------------------------------------------------------------------------
