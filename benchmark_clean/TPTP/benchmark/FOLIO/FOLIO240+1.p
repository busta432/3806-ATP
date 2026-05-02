%------------------------------------------------------------------------------
% File     : FOLIO240+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 2 musicians all practices
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((musician(X) => practices(X))) )).
fof(e0, axiom, ( musician(alice) )).
fof(e1, axiom, ( musician(bob) )).
fof(goal, conjecture, ( practices(alice) & practices(bob) )).
%------------------------------------------------------------------------------
