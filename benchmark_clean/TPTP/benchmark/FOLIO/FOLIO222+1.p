%------------------------------------------------------------------------------
% File     : FOLIO222+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : graduation missing completed_credits
% Status   : CounterSatisfiable
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((completed_credits(X) & passed_thesis(X) & no_debts(X) & attended_ceremony(X) => graduated(X))) )).
fof(has_passed_thesis, axiom, ( passed_thesis(applicant) )).
fof(has_no_debts, axiom, ( no_debts(applicant) )).
fof(has_attended_ceremony, axiom, ( attended_ceremony(applicant) )).
fof(goal, conjecture, ( graduated(applicant) )).
%------------------------------------------------------------------------------
