%------------------------------------------------------------------------------
% File     : FOLIO266+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: charlie not present so absent
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (present(X) | absent(X)) )).
fof(xor2, axiom, ( ! [X] : (~(present(X) & absent(X))) )).
fof(fact, axiom, ( ~present(charlie) )).
fof(goal, conjecture, ( absent(charlie) )).
%------------------------------------------------------------------------------
