%------------------------------------------------------------------------------
% File     : FOLIO243+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 5 musicians all practices
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((musician(X) => practices(X))) )).
fof(e0, axiom, ( musician(alice) )).
fof(e1, axiom, ( musician(bob) )).
fof(e2, axiom, ( musician(charlie) )).
fof(e3, axiom, ( musician(diana) )).
fof(e4, axiom, ( musician(eve) )).
fof(goal, conjecture, ( practices(alice) & practices(bob) & practices(charlie) & practices(diana) & practices(eve) )).
%------------------------------------------------------------------------------
