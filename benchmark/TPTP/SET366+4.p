%--------------------------------------------------------------------------
% File     : SET366+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : The empty set is in every power set
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.06 v7.5.0, 0.03 v7.4.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.00 v6.4.0, 0.04 v6.3.0, 0.12 v6.2.0, 0.08 v6.1.0, 0.10 v6.0.0, 0.09 v5.5.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.05 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.1, 0.04 v4.0.0, 0.08 v3.7.0, 0.15 v3.5.0, 0.16 v3.4.0, 0.00 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.00 v2.2.1
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
fof(thI47,conjecture,
    ! [A] : member(empty_set,power_set(A)) ).

%--------------------------------------------------------------------------
