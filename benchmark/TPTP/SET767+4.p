%--------------------------------------------------------------------------
% File     : SET767+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Equivalence relations)
% Problem  : Equivalence classes on E are power_set E
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.19 v8.1.0, 0.17 v7.5.0, 0.16 v7.4.0, 0.17 v7.3.0, 0.21 v7.2.0, 0.17 v7.1.0, 0.13 v6.4.0, 0.15 v6.3.0, 0.21 v6.2.0, 0.16 v6.1.0, 0.27 v6.0.0, 0.30 v5.4.0, 0.36 v5.3.0, 0.37 v5.2.0, 0.30 v5.1.0, 0.33 v4.1.0, 0.35 v4.0.0, 0.42 v3.7.0, 0.35 v3.5.0, 0.32 v3.3.0, 0.21 v3.2.0, 0.36 v3.1.0, 0.33 v2.7.0, 0.17 v2.6.0, 0.29 v2.5.0, 0.38 v2.4.0, 0.25 v2.3.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   17 (   1 unt;   0 def)
%            Number of atoms       :   70 (   4 equ)
%            Maximal formula atoms :   13 (   4 avg)
%            Number of connectives :   56 (   3   ~;   2   |;  21   &)
%                                         (  15 <=>;  15  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   12 (   7 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    9 (   8 usr;   0 prp; 2-3 aty)
%            Number of functors    :   10 (  10 usr;   1 con; 0-3 aty)
%            Number of variables   :   60 (  56   !;   4   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%----Include equivalence relation axioms
include('Axioms/SET006+2.ax').
%--------------------------------------------------------------------------
fof(thIII03,conjecture,
    ! [E,R,A] :
      ( equivalence(R,E)
     => subset(equivalence_class(A,E,R),E) ) ).

%--------------------------------------------------------------------------
