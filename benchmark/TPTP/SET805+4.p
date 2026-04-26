%------------------------------------------------------------------------------
% File     : SET805+4 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set Theory (Order relations)
% Problem  : Order relation on E is an order relation on a subset of E
% Version  : [Pas05] axioms.
% English  :

% Refs     : [Pas05] Pastre (2005), Email to G. Sutcliffe
% Source   : [Pas05]
% Names    :

% Status   : Theorem
% Rating   : 0.58 v8.1.0, 0.56 v7.5.0, 0.53 v7.3.0, 0.45 v7.2.0, 0.41 v7.1.0, 0.39 v7.0.0, 0.50 v6.2.0, 0.44 v6.1.0, 0.50 v6.0.0, 0.61 v5.5.0, 0.63 v5.4.0, 0.68 v5.3.0, 0.70 v5.2.0, 0.60 v5.1.0, 0.67 v4.1.0, 0.70 v4.0.0, 0.75 v3.5.0, 0.84 v3.4.0, 0.89 v3.3.0, 0.86 v3.2.0
% Syntax   : Number of formulae    :   22 (   1 unt;   0 def)
%            Number of atoms       :   88 (   6 equ)
%            Maximal formula atoms :   14 (   4 avg)
%            Number of connectives :   68 (   2   ~;   3   |;  25   &)
%                                         (  20 <=>;  18  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   12 (   7 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   15 (  14 usr;   0 prp; 2-4 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   77 (  76   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%----Include order relation axioms
include('Axioms/SET006+3.ax').
%------------------------------------------------------------------------------
fof(thIV17,conjecture,
    ! [R,E] :
      ( order(R,E)
     => ! [X] :
          ( subset(X,E)
         => order(R,X) ) ) ).

%------------------------------------------------------------------------------
