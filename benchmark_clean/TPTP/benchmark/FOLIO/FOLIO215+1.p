%------------------------------------------------------------------------------
% File     : FOLIO215+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : driving_license missing min_age
% Status   : CounterSatisfiable
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((passed_theory(X) & passed_practical(X) & good_vision(X) & min_age(X) => licensed(X))) )).
fof(has_passed_theory, axiom, ( passed_theory(applicant) )).
fof(has_passed_practical, axiom, ( passed_practical(applicant) )).
fof(has_good_vision, axiom, ( good_vision(applicant) )).
fof(goal, conjecture, ( licensed(applicant) )).
%------------------------------------------------------------------------------
