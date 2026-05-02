%------------------------------------------------------------------------------
% File     : FOLIO227+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Symmetric friend_of
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sym, axiom, ( ! [X,Y] : ((friend_of(X,Y) => friend_of(Y,X))) )).
fof(fact, axiom, ( friend_of(alice,bob) )).
fof(goal, conjecture, ( friend_of(bob,alice) )).
%------------------------------------------------------------------------------
