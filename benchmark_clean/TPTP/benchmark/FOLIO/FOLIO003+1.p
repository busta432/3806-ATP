%------------------------------------------------------------------------------
% File     : FOLIO003+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every nurse is a healthcare_worker
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((nurse(X) => medical_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((medical_professional(X) => healthcare_worker(X))) )).
fof(ax3, axiom, ( nurse(person1) )).
fof(goal, conjecture, ( healthcare_worker(person1) )).
%------------------------------------------------------------------------------
