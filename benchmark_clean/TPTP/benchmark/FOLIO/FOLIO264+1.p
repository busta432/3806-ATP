%------------------------------------------------------------------------------
% File     : FOLIO264+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: alice not present so absent
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (present(X) | absent(X)) )).
fof(xor2, axiom, ( ! [X] : (~(present(X) & absent(X))) )).
fof(fact, axiom, ( ~present(alice) )).
fof(goal, conjecture, ( absent(alice) )).
%------------------------------------------------------------------------------
