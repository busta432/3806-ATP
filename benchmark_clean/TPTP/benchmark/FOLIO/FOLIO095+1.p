%------------------------------------------------------------------------------
% File     : FOLIO095+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Multi-hop 4 steps
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(step1, axiom, ( ! [X] : ((prop0(X) => prop1(X))) )).
fof(step2, axiom, ( ! [X] : ((prop1(X) => prop2(X))) )).
fof(step3, axiom, ( ! [X] : ((prop2(X) => prop3(X))) )).
fof(step4, axiom, ( ! [X] : ((prop3(X) => prop4(X))) )).
fof(base, axiom, ( prop0(entity1) )).
fof(goal, conjecture, ( prop4(entity1) )).
%------------------------------------------------------------------------------
