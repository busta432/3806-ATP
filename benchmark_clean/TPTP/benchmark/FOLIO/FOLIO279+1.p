%------------------------------------------------------------------------------
% File     : FOLIO279+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: diana not open so closed
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (open(X) | closed(X)) )).
fof(xor2, axiom, ( ! [X] : (~(open(X) & closed(X))) )).
fof(fact, axiom, ( ~open(diana) )).
fof(goal, conjecture, ( closed(diana) )).
%------------------------------------------------------------------------------
