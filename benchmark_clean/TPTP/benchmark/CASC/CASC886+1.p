%------------------------------------------------------------------------------
% File     : CASC886+1
% Domain   : Competition (CASC-style)
% Problem  : implies_r chain 3
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((implies_r(X,Y) & implies_r(Y,Z) => implies_r(X,Z))) )).
fof(e0, axiom, ( implies_r(x0,x1) )).
fof(e1, axiom, ( implies_r(x1,x2) )).
fof(e2, axiom, ( implies_r(x2,x3) )).
fof(goal, conjecture, ( implies_r(x0,x3) )).
%------------------------------------------------------------------------------
