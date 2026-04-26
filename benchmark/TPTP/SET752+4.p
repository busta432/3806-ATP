%------------------------------------------------------------------------------
% File     : SET752+4 : TPTP v8.1.2. Bugfixed v2.2.1.
% Domain   : Set Theory (Mappings)
% Problem  : The image of union is equal to the union of images
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.81 v8.1.0, 0.75 v7.4.0, 0.70 v7.3.0, 0.69 v7.1.0, 0.65 v7.0.0, 0.73 v6.4.0, 0.77 v6.3.0, 0.75 v6.2.0, 0.72 v6.1.0, 0.77 v6.0.0, 0.83 v5.5.0, 0.89 v5.4.0, 0.93 v5.2.0, 0.95 v5.0.0, 0.96 v3.7.0, 0.95 v3.3.0, 0.93 v3.2.0, 0.91 v3.1.0, 0.89 v2.7.0, 0.83 v2.6.0, 0.86 v2.5.0, 0.88 v2.4.0, 0.75 v2.3.0, 0.67 v2.2.1
% Syntax   : Number of formulae    :   29 (   1 unt;   0 def)
%            Number of atoms       :  132 (   6 equ)
%            Maximal formula atoms :   11 (   4 avg)
%            Number of connectives :  105 (   2   ~;   2   |;  52   &)
%                                         (  30 <=>;  19  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   19 (   9 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :   16 (  15 usr;   0 prp; 2-6 aty)
%            Number of functors    :   15 (  15 usr;   1 con; 0-5 aty)
%            Number of variables   :  138 ( 129   !;   9   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixes : v2.2.1 - Bugfixes in SET006+1.ax.
%------------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%----Include mappings axioms
include('Axioms/SET006+1.ax').
%------------------------------------------------------------------------------
fof(thIIa02,conjecture,
    ! [F,A,B,X,Y] :
      ( ( maps(F,A,B)
        & subset(X,A)
        & subset(Y,A) )
     => equal_set(image2(F,union(X,Y)),union(image2(F,X),image2(F,Y))) ) ).

%------------------------------------------------------------------------------
