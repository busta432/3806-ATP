%------------------------------------------------------------------------------
% File     : CASC106+1
% Domain   : Competition (CASC-style)
% Problem  : Transitive closure 6-chain
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(comp, axiom, ( ! [X,Y,Z] : ((rel(X,Y) & rel(Y,Z) => rel(X,Z))) )).
fof(e1, axiom, ( rel(nd0,nd1) )).
fof(e2, axiom, ( rel(nd1,nd2) )).
fof(e3, axiom, ( rel(nd2,nd3) )).
fof(e4, axiom, ( rel(nd3,nd4) )).
fof(e5, axiom, ( rel(nd4,nd5) )).
fof(e6, axiom, ( rel(nd5,nd6) )).
fof(goal, conjecture, ( rel(nd0,nd6) )).
%------------------------------------------------------------------------------
