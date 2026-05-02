%------------------------------------------------------------------------------
% File     : CASC415+1
% Domain   : Competition (CASC-style)
% Problem  : Boolean algebra: De Morgan or
% Status   : Theorem
% Rating   : 0.49 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(or_comm, axiom, ( ! [X,Y] : (or_b(X,Y) = or_b(Y,X)) )).
fof(and_comm, axiom, ( ! [X,Y] : (and_b(X,Y) = and_b(Y,X)) )).
fof(or_assoc, axiom, ( ! [X,Y,Z] : (or_b(or_b(X,Y),Z) = or_b(X,or_b(Y,Z))) )).
fof(and_assoc, axiom, ( ! [X,Y,Z] : (and_b(and_b(X,Y),Z) = and_b(X,and_b(Y,Z))) )).
fof(dist1, axiom, ( ! [X,Y,Z] : (and_b(X,or_b(Y,Z)) = or_b(and_b(X,Y),and_b(X,Z))) )).
fof(dist2, axiom, ( ! [X,Y,Z] : (or_b(X,and_b(Y,Z)) = and_b(or_b(X,Y),or_b(X,Z))) )).
fof(id1, axiom, ( ! [X] : (or_b(X,zero) = X) )).
fof(id2, axiom, ( ! [X] : (and_b(X,one) = X) )).
fof(comp1, axiom, ( ! [X] : (or_b(X,comp(X)) = one) )).
fof(comp2, axiom, ( ! [X] : (and_b(X,comp(X)) = zero) )).
fof(goal, conjecture, ( comp(or_b(a,b)) = and_b(comp(a),comp(b)) )).
%------------------------------------------------------------------------------
