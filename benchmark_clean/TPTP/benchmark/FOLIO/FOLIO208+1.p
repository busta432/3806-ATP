%------------------------------------------------------------------------------
% File     : FOLIO208+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : loan_approval missing stable_income
% Status   : CounterSatisfiable
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((good_credit(X) & stable_income(X) & low_debt(X) & has_collateral(X) => loan_approved(X))) )).
fof(has_good_credit, axiom, ( good_credit(applicant) )).
fof(has_low_debt, axiom, ( low_debt(applicant) )).
fof(has_has_collateral, axiom, ( has_collateral(applicant) )).
fof(goal, conjecture, ( loan_approved(applicant) )).
%------------------------------------------------------------------------------
