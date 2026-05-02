%------------------------------------------------------------------------------
% File     : FOLIO281+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: bob not win so lose
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (win(X) | lose(X)) )).
fof(xor2, axiom, ( ! [X] : (~(win(X) & lose(X))) )).
fof(fact, axiom, ( ~win(bob) )).
fof(goal, conjecture, ( lose(bob) )).
%------------------------------------------------------------------------------
