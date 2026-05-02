%------------------------------------------------------------------------------
% File     : CASC401+1
% Domain   : Competition (CASC-style)
% Problem  : Lattice chain 3 elements
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(join_comm, axiom, ( ! [X,Y] : (join(X,Y) = join(Y,X)) )).
fof(meet_comm, axiom, ( ! [X,Y] : (meet(X,Y) = meet(Y,X)) )).
fof(join_assoc, axiom, ( ! [X,Y,Z] : (join(join(X,Y),Z) = join(X,join(Y,Z))) )).
fof(meet_assoc, axiom, ( ! [X,Y,Z] : (meet(meet(X,Y),Z) = meet(X,meet(Y,Z))) )).
fof(absorb1, axiom, ( ! [X,Y] : (join(X,meet(X,Y)) = X) )).
fof(absorb2, axiom, ( ! [X,Y] : (meet(X,join(X,Y)) = X) )).
fof(ord0, axiom, ( meet(e0,e1) = e0 )).
fof(ord1, axiom, ( meet(e1,e2) = e1 )).
fof(goal, conjecture, ( meet(e0,e2) = e0 )).
%------------------------------------------------------------------------------
