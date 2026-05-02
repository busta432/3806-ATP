%------------------------------------------------------------------------------
% File     : CASC704+1
% Domain   : Competition (CASC-style)
% Problem  : Mixed quantifier 11 relations
% Status   : Theorem
% Rating   : 0.60 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : (? [Y] : (r0(X,Y))) )).
fof(ax1, axiom, ( ! [X] : (? [Y] : (r1(X,Y))) )).
fof(chain1, axiom, ( ! [X,Y] : ((r0(X,Y) => s1(Y))) )).
fof(ax2, axiom, ( ! [X] : (? [Y] : (r2(X,Y))) )).
fof(chain2, axiom, ( ! [X,Y] : ((r1(X,Y) => s2(Y))) )).
fof(ax3, axiom, ( ! [X] : (? [Y] : (r3(X,Y))) )).
fof(chain3, axiom, ( ! [X,Y] : ((r2(X,Y) => s3(Y))) )).
fof(ax4, axiom, ( ! [X] : (? [Y] : (r4(X,Y))) )).
fof(chain4, axiom, ( ! [X,Y] : ((r3(X,Y) => s4(Y))) )).
fof(ax5, axiom, ( ! [X] : (? [Y] : (r5(X,Y))) )).
fof(chain5, axiom, ( ! [X,Y] : ((r4(X,Y) => s5(Y))) )).
fof(ax6, axiom, ( ! [X] : (? [Y] : (r6(X,Y))) )).
fof(chain6, axiom, ( ! [X,Y] : ((r5(X,Y) => s6(Y))) )).
fof(ax7, axiom, ( ! [X] : (? [Y] : (r7(X,Y))) )).
fof(chain7, axiom, ( ! [X,Y] : ((r6(X,Y) => s7(Y))) )).
fof(ax8, axiom, ( ! [X] : (? [Y] : (r8(X,Y))) )).
fof(chain8, axiom, ( ! [X,Y] : ((r7(X,Y) => s8(Y))) )).
fof(ax9, axiom, ( ! [X] : (? [Y] : (r9(X,Y))) )).
fof(chain9, axiom, ( ! [X,Y] : ((r8(X,Y) => s9(Y))) )).
fof(ax10, axiom, ( ! [X] : (? [Y] : (r10(X,Y))) )).
fof(chain10, axiom, ( ! [X,Y] : ((r9(X,Y) => s10(Y))) )).
fof(start, axiom, ( r0(a,b) )).
fof(goal, conjecture, ( s1(b) )).
%------------------------------------------------------------------------------
