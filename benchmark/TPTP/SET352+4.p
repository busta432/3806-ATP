%--------------------------------------------------------------------------
% File     : SET352+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : The sum of an unordered pair is the union of the pair
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.75 v8.1.0, 0.72 v7.5.0, 0.66 v7.4.0, 0.60 v7.3.0, 0.66 v7.1.0, 0.61 v7.0.0, 0.70 v6.4.0, 0.73 v6.3.0, 0.71 v6.2.0, 0.72 v6.1.0, 0.80 v6.0.0, 0.78 v5.5.0, 0.89 v5.3.0, 0.93 v5.2.0, 0.95 v5.0.0, 0.96 v4.0.1, 0.91 v4.0.0, 0.92 v3.7.0, 0.90 v3.5.0, 0.89 v3.4.0, 0.95 v3.3.0, 0.93 v3.2.0, 0.91 v3.1.0, 0.78 v2.7.0, 0.83 v2.6.0, 0.86 v2.5.0, 0.88 v2.4.0, 0.50 v2.3.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :   12 (   2 unt;   0 def)
%            Number of atoms       :   30 (   3 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   20 (   2   ~;   2   |;   4   &)
%                                         (  10 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   30 (  29   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%--------------------------------------------------------------------------
fof(thI40,conjecture,
    ! [A,B] : equal_set(sum(unordered_pair(A,B)),union(A,B)) ).

%--------------------------------------------------------------------------
