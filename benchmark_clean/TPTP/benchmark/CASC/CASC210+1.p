%------------------------------------------------------------------------------
% File     : CASC210+1
% Domain   : Competition (CASC-style)
% Problem  : Function nesting depth 10
% Status   : Theorem
% Rating   : 0.60 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(base, axiom, ( p(a) )).
fof(step, axiom, ( ! [X] : ((p(X) => p(f(X)))) )).
fof(goal, conjecture, ( p(f(f(f(f(f(f(f(f(f(f(a))))))))))) )).
%------------------------------------------------------------------------------
