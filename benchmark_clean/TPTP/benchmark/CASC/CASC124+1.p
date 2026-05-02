%------------------------------------------------------------------------------
% File     : CASC124+1
% Domain   : Competition (CASC-style)
% Problem  : Transitive closure 24-chain
% Status   : Theorem
% Rating   : 0.80 v1.0.0
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
fof(e7, axiom, ( rel(nd6,nd7) )).
fof(e8, axiom, ( rel(nd7,nd8) )).
fof(e9, axiom, ( rel(nd8,nd9) )).
fof(e10, axiom, ( rel(nd9,nd10) )).
fof(e11, axiom, ( rel(nd10,nd11) )).
fof(e12, axiom, ( rel(nd11,nd12) )).
fof(e13, axiom, ( rel(nd12,nd13) )).
fof(e14, axiom, ( rel(nd13,nd14) )).
fof(e15, axiom, ( rel(nd14,nd15) )).
fof(e16, axiom, ( rel(nd15,nd16) )).
fof(e17, axiom, ( rel(nd16,nd17) )).
fof(e18, axiom, ( rel(nd17,nd18) )).
fof(e19, axiom, ( rel(nd18,nd19) )).
fof(e20, axiom, ( rel(nd19,nd20) )).
fof(e21, axiom, ( rel(nd20,nd21) )).
fof(e22, axiom, ( rel(nd21,nd22) )).
fof(e23, axiom, ( rel(nd22,nd23) )).
fof(e24, axiom, ( rel(nd23,nd24) )).
fof(goal, conjecture, ( rel(nd0,nd24) )).
%------------------------------------------------------------------------------
