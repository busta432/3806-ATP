%------------------------------------------------------------------------------
% File     : CASC692+1
% Domain   : Competition (CASC-style)
% Problem  : A subset B does not imply B subset A
% Status   : CounterSatisfiable
% Rating   : 0.15 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(a1, axiom, ( subset(s1,s2) )).
fof(goal, conjecture, ( subset(s2,s1) )).
%------------------------------------------------------------------------------
