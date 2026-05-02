%------------------------------------------------------------------------------
% File     : FOLIO002+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Not every healthcare_worker is a doctor
% Status   : CounterSatisfiable
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((doctor(X) => medical_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((medical_professional(X) => healthcare_worker(X))) )).
fof(ax3, axiom, ( healthcare_worker(person1) )).
fof(goal, conjecture, ( doctor(person1) )).
%------------------------------------------------------------------------------
