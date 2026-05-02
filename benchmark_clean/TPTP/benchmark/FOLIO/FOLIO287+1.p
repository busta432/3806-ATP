%------------------------------------------------------------------------------
% File     : FOLIO287+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: diana not true_val so false_val
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (true_val(X) | false_val(X)) )).
fof(xor2, axiom, ( ! [X] : (~(true_val(X) & false_val(X))) )).
fof(fact, axiom, ( ~true_val(diana) )).
fof(goal, conjecture, ( false_val(diana) )).
%------------------------------------------------------------------------------
