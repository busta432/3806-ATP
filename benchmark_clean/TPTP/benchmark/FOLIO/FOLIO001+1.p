%------------------------------------------------------------------------------
% File     : FOLIO001+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every doctor is a healthcare_worker
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((doctor(X) => medical_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((medical_professional(X) => healthcare_worker(X))) )).
fof(ax3, axiom, ( doctor(person1) )).
fof(goal, conjecture, ( healthcare_worker(person1) )).
%------------------------------------------------------------------------------
