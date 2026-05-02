%------------------------------------------------------------------------------
% File     : CASC695+1
% Domain   : Competition (CASC-style)
% Problem  : Mixed quantifier 2 relations
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : (? [Y] : (r0(X,Y))) )).
fof(ax1, axiom, ( ! [X] : (? [Y] : (r1(X,Y))) )).
fof(chain1, axiom, ( ! [X,Y] : ((r0(X,Y) => s1(Y))) )).
fof(start, axiom, ( r0(a,b) )).
fof(goal, conjecture, ( s1(b) )).
%------------------------------------------------------------------------------
