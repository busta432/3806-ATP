%------------------------------------------------------------------------------
% File     : FOLIO218+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : job_offer missing interviewed
% Status   : CounterSatisfiable
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((qualified(X) & interviewed(X) & background_check(X) & reference_check(X) => hired(X))) )).
fof(has_qualified, axiom, ( qualified(applicant) )).
fof(has_background_check, axiom, ( background_check(applicant) )).
fof(has_reference_check, axiom, ( reference_check(applicant) )).
fof(goal, conjecture, ( hired(applicant) )).
%------------------------------------------------------------------------------
