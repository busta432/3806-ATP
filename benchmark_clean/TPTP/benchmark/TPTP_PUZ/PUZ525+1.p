%------------------------------------------------------------------------------
% File     : PUZ525+1
% Domain   : Puzzles
% Problem  : Graph coloring 3 nodes 2 colors
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(v0_has_color, axiom, ( color(v0,col0) | color(v0,col1) )).
fof(v1_has_color, axiom, ( color(v1,col0) | color(v1,col1) )).
fof(v2_has_color, axiom, ( color(v2,col0) | color(v2,col1) )).
fof(adj0, axiom, ( adjacent(v0,v1) )).
fof(adj1, axiom, ( adjacent(v1,v2) )).
fof(no_same, axiom, ( ! [X,Y,C] : ((adjacent(X,Y) & color(X,C) & color(Y,C) => $false)) )).
fof(goal, conjecture, ( ? [C] : (color(v0,C)) )).
%------------------------------------------------------------------------------
