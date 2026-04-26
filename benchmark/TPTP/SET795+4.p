%------------------------------------------------------------------------------
% File     : SET795+4 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set Theory (Order relations)
% Problem  : If R(a,b) then b is the least upper bound of unordered_pair(a,b)
% Version  : [Pas05] axioms.
% English  :

% Refs     : [Pas05] Pastre (2005), Email to G. Sutcliffe
% Source   : [Pas05]
% Names    :

% Status   : Theorem
% Rating   : 0.58 v8.1.0, 0.56 v7.5.0, 0.62 v7.4.0, 0.47 v7.3.0, 0.52 v7.1.0, 0.48 v7.0.0, 0.57 v6.4.0, 0.58 v6.3.0, 0.54 v6.2.0, 0.60 v6.1.0, 0.67 v6.0.0, 0.70 v5.4.0, 0.82 v5.3.0, 0.81 v5.2.0, 0.80 v5.1.0, 0.81 v5.0.0, 0.79 v4.1.0, 0.78 v4.0.0, 0.79 v3.7.0, 0.85 v3.5.0, 0.84 v3.3.0, 0.86 v3.2.0
% Syntax   : Number of formulae    :   22 (   1 unt;   0 def)
%            Number of atoms       :   90 (   6 equ)
%            Maximal formula atoms :   14 (   4 avg)
%            Number of connectives :   70 (   2   ~;   3   |;  28   &)
%                                         (  20 <=>;  17  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   12 (   7 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   15 (  14 usr;   0 prp; 2-4 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   78 (  77   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%----Include order relation axioms
include('Axioms/SET006+3.ax').
%------------------------------------------------------------------------------
fof(thIV7,conjecture,
    ! [R,E,A,B] :
      ( ( order(R,E)
        & member(A,E)
        & member(B,E)
        & apply(R,A,B) )
     => least_upper_bound(B,unordered_pair(A,B),R,E) ) ).

%------------------------------------------------------------------------------
