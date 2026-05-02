%------------------------------------------------------------------------------
% File     : FOLIO267+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: diana not present so absent
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (present(X) | absent(X)) )).
fof(xor2, axiom, ( ! [X] : (~(present(X) & absent(X))) )).
fof(fact, axiom, ( ~present(diana) )).
fof(goal, conjecture, ( absent(diana) )).
%------------------------------------------------------------------------------
