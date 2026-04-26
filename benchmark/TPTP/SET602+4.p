%--------------------------------------------------------------------------
% File     : SET602+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : The difference of X and X is the empty set
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.22 v8.1.0, 0.19 v7.5.0, 0.22 v7.4.0, 0.20 v7.3.0, 0.21 v7.2.0, 0.17 v7.1.0, 0.09 v7.0.0, 0.10 v6.4.0, 0.12 v6.1.0, 0.20 v6.0.0, 0.22 v5.5.0, 0.26 v5.4.0, 0.32 v5.3.0, 0.37 v5.2.0, 0.30 v5.1.0, 0.33 v4.1.0, 0.35 v4.0.0, 0.33 v3.7.0, 0.30 v3.5.0, 0.32 v3.4.0, 0.37 v3.3.0, 0.29 v3.2.0, 0.36 v3.1.0, 0.33 v2.7.0, 0.17 v2.6.0, 0.29 v2.5.0, 0.25 v2.4.0, 0.25 v2.3.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   12 (   2 unt;   0 def)
%            Number of atoms       :   30 (   3 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   20 (   2   ~;   2   |;   4   &)
%                                         (  10 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   29 (  28   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%--------------------------------------------------------------------------
fof(thI29,conjecture,
    ! [E] : equal_set(difference(E,E),empty_set) ).

%--------------------------------------------------------------------------
