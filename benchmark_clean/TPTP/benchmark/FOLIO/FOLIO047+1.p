%------------------------------------------------------------------------------
% File     : FOLIO047+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Voting eligibility
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((citizen(X) & adult(X) & registered(X) => can_vote(X))) )).
fof(ax2, axiom, ( (age_over_18(alice) => adult(alice)) )).
fof(ax3, axiom, ( citizen(alice) )).
fof(ax4, axiom, ( age_over_18(alice) )).
fof(ax5, axiom, ( registered(alice) )).
fof(goal, conjecture, ( can_vote(alice) )).
%------------------------------------------------------------------------------
