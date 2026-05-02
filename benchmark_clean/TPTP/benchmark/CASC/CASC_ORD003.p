%------------------------------------------------------------------------------
% File     : CASC_ORD003
% Domain   : Competition (CASC-style)
% Problem  : Total order trichotomy
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(total, axiom, ( ! [X,Y] : (leq(X,Y) | leq(Y,X)) )).
fof(goal, conjecture, ( leq(a,b) | leq(b,a) )).
%------------------------------------------------------------------------------
