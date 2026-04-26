%--------------------------------------------------------------------------
% File     : SET699+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : Property of intersection and difference 1
% Version  : [Pas99] axioms.
% English  : A is a subset of B if and only if the intersection of A and
%            of the difference of B is a subset of the difference of A.

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.47 v7.5.0, 0.50 v7.4.0, 0.47 v7.3.0, 0.41 v7.2.0, 0.38 v7.1.0, 0.35 v7.0.0, 0.43 v6.4.0, 0.42 v6.3.0, 0.46 v6.2.0, 0.44 v6.1.0, 0.57 v5.5.0, 0.63 v5.4.0, 0.64 v5.3.0, 0.67 v5.2.0, 0.55 v5.1.0, 0.57 v5.0.0, 0.58 v4.1.0, 0.57 v4.0.1, 0.61 v4.0.0, 0.62 v3.7.0, 0.65 v3.5.0, 0.68 v3.4.0, 0.74 v3.3.0, 0.64 v3.2.0, 0.73 v3.1.0, 0.78 v2.7.0, 0.83 v2.6.0, 0.86 v2.5.0, 0.88 v2.4.0, 0.25 v2.3.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   12 (   1 unt;   0 def)
%            Number of atoms       :   33 (   3 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   23 (   2   ~;   2   |;   5   &)
%                                         (  11 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   31 (  30   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%--------------------------------------------------------------------------
fof(thI33,conjecture,
    ! [A,B,E] :
      ( ( subset(A,E)
        & subset(B,E) )
     => ( subset(A,B)
      <=> subset(intersection(A,difference(E,B)),difference(E,A)) ) ) ).

%--------------------------------------------------------------------------
