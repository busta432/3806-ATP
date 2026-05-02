%------------------------------------------------------------------------------
% File     : FOLIO054+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Disjunctive: one of reads_fiction/reads_nonfiction/reads_poetry implies reads
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((reads_fiction(X) => reads(X))) )).
fof(ax2, axiom, ( ! [X] : ((reads_nonfiction(X) => reads(X))) )).
fof(ax3, axiom, ( ! [X] : ((reads_poetry(X) => reads(X))) )).
fof(ax4, axiom, ( reads_fiction(person1) | reads_nonfiction(person1) | reads_poetry(person1) )).
fof(goal, conjecture, ( reads(person1) )).
%------------------------------------------------------------------------------
