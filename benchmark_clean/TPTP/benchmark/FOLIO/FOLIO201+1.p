%------------------------------------------------------------------------------
% File     : FOLIO201+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : university_admission all conditions met
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((has_diploma(X) & passed_exam(X) & submitted_app(X) & paid_fee(X) => admitted(X))) )).
fof(has_has_diploma, axiom, ( has_diploma(applicant) )).
fof(has_passed_exam, axiom, ( passed_exam(applicant) )).
fof(has_submitted_app, axiom, ( submitted_app(applicant) )).
fof(has_paid_fee, axiom, ( paid_fee(applicant) )).
fof(goal, conjecture, ( admitted(applicant) )).
%------------------------------------------------------------------------------
