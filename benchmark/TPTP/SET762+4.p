%--------------------------------------------------------------------------
% File     : SET762+4 : TPTP v8.1.2. Bugfixed v2.2.1.
% Domain   : Set Theory (Mappings)
% Problem  : The image of empty set is empty
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.19 v8.1.0, 0.17 v7.5.0, 0.16 v7.4.0, 0.17 v7.2.0, 0.14 v7.1.0, 0.13 v7.0.0, 0.17 v6.4.0, 0.23 v6.3.0, 0.21 v6.2.0, 0.16 v6.1.0, 0.27 v6.0.0, 0.30 v5.5.0, 0.41 v5.4.0, 0.43 v5.3.0, 0.44 v5.2.0, 0.35 v5.1.0, 0.38 v5.0.0, 0.42 v4.1.0, 0.39 v4.0.0, 0.42 v3.7.0, 0.45 v3.5.0, 0.42 v3.4.0, 0.47 v3.3.0, 0.43 v3.2.0, 0.45 v3.1.0, 0.56 v2.7.0, 0.33 v2.6.0, 0.43 v2.5.0, 0.50 v2.4.0, 0.50 v2.3.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :   29 (   1 unt;   0 def)
%            Number of atoms       :  130 (   6 equ)
%            Maximal formula atoms :   11 (   4 avg)
%            Number of connectives :  103 (   2   ~;   2   |;  50   &)
%                                         (  30 <=>;  19  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   19 (   9 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   16 (  15 usr;   0 prp; 2-6 aty)
%            Number of functors    :   15 (  15 usr;   1 con; 0-5 aty)
%            Number of variables   :  136 ( 127   !;   9   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixes : v2.2.1 - Bugfixes in SET006+1.ax.
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%----Include mappings axioms
include('Axioms/SET006+1.ax').
%--------------------------------------------------------------------------
fof(thIIa12,conjecture,
    ! [F,A,B] :
      ( maps(F,A,B)
     => equal_set(image2(F,empty_set),empty_set) ) ).

%--------------------------------------------------------------------------
