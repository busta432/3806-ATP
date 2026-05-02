%------------------------------------------------------------------------------
% File     : CASC696+1
% Domain   : Competition (CASC-style)
% Problem  : Mixed quantifier 3 relations
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : (? [Y] : (r0(X,Y))) )).
fof(ax1, axiom, ( ! [X] : (? [Y] : (r1(X,Y))) )).
fof(chain1, axiom, ( ! [X,Y] : ((r0(X,Y) => s1(Y))) )).
fof(ax2, axiom, ( ! [X] : (? [Y] : (r2(X,Y))) )).
fof(chain2, axiom, ( ! [X,Y] : ((r1(X,Y) => s2(Y))) )).
fof(start, axiom, ( r0(a,b) )).
fof(goal, conjecture, ( s1(b) )).
%------------------------------------------------------------------------------
