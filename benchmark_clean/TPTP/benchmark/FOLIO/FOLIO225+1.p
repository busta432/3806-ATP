%------------------------------------------------------------------------------
% File     : FOLIO225+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : graduation missing attended_ceremony
% Status   : CounterSatisfiable
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((completed_credits(X) & passed_thesis(X) & no_debts(X) & attended_ceremony(X) => graduated(X))) )).
fof(has_completed_credits, axiom, ( completed_credits(applicant) )).
fof(has_passed_thesis, axiom, ( passed_thesis(applicant) )).
fof(has_no_debts, axiom, ( no_debts(applicant) )).
fof(goal, conjecture, ( graduated(applicant) )).
%------------------------------------------------------------------------------
