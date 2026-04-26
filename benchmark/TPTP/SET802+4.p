%------------------------------------------------------------------------------
% File     : SET802+4 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set Theory (Order relations)
% Problem  : M is the least of X iff it is a member and a GLB
% Version  : [Pas05] axioms.
% English  :

% Refs     : [Pas05] Pastre (2005), Email to G. Sutcliffe
% Source   : [Pas05]
% Names    :

% Status   : Theorem
% Rating   : 0.42 v8.1.0, 0.36 v7.5.0, 0.38 v7.4.0, 0.33 v7.3.0, 0.31 v7.2.0, 0.28 v7.1.0, 0.30 v7.0.0, 0.40 v6.4.0, 0.42 v6.2.0, 0.40 v6.1.0, 0.50 v6.0.0, 0.52 v5.5.0, 0.59 v5.4.0, 0.68 v5.3.0, 0.70 v5.2.0, 0.55 v5.1.0, 0.57 v5.0.0, 0.58 v4.1.0, 0.57 v4.0.1, 0.52 v4.0.0, 0.54 v3.7.0, 0.55 v3.5.0, 0.58 v3.4.0, 0.68 v3.3.0, 0.79 v3.2.0
% Syntax   : Number of formulae    :   22 (   1 unt;   0 def)
%            Number of atoms       :   90 (   6 equ)
%            Maximal formula atoms :   14 (   4 avg)
%            Number of connectives :   70 (   2   ~;   3   |;  26   &)
%                                         (  21 <=>;  18  =>;   0  <=;   0 <~>)
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
fof(thIV14,conjecture,
    ! [R,E] :
      ( order(R,E)
     => ! [X] :
          ( subset(X,E)
         => ! [M] :
              ( least(M,R,X)
            <=> ( member(M,X)
                & greatest_lower_bound(M,X,R,E) ) ) ) ) ).

%------------------------------------------------------------------------------
