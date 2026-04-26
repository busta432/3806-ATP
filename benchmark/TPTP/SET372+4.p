%--------------------------------------------------------------------------
% File     : SET372+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : Power set distributes over intersection
% Version  : [Pas99] axioms.
% English  : The power_set of the intersection of A and B is equal to the
%            intersection of the power_set of A and the power_set of B.

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.78 v8.1.0, 0.72 v7.5.0, 0.69 v7.4.0, 0.70 v7.3.0, 0.69 v7.1.0, 0.61 v7.0.0, 0.70 v6.4.0, 0.73 v6.3.0, 0.75 v6.2.0, 0.68 v6.1.0, 0.73 v6.0.0, 0.83 v5.5.0, 0.85 v5.4.0, 0.93 v5.2.0, 0.95 v5.0.0, 0.96 v3.7.0, 0.95 v3.3.0, 0.93 v3.2.0, 0.91 v3.1.0, 0.89 v2.7.0, 0.83 v2.6.0, 0.86 v2.5.0, 0.88 v2.4.0, 0.75 v2.3.0, 0.67 v2.2.1
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
fof(thI21,conjecture,
    ! [A,B] : equal_set(power_set(intersection(A,B)),intersection(power_set(A),power_set(B))) ).

%--------------------------------------------------------------------------
