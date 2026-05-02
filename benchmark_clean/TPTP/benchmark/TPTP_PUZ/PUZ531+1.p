%------------------------------------------------------------------------------
% File     : PUZ531+1
% Domain   : Puzzles
% Problem  : Graph coloring 6 nodes 2 colors
% Status   : Theorem
% Rating   : 0.60 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(v0_has_color, axiom, ( color(v0,col0) | color(v0,col1) )).
fof(v1_has_color, axiom, ( color(v1,col0) | color(v1,col1) )).
fof(v2_has_color, axiom, ( color(v2,col0) | color(v2,col1) )).
fof(v3_has_color, axiom, ( color(v3,col0) | color(v3,col1) )).
fof(v4_has_color, axiom, ( color(v4,col0) | color(v4,col1) )).
fof(v5_has_color, axiom, ( color(v5,col0) | color(v5,col1) )).
fof(adj0, axiom, ( adjacent(v0,v1) )).
fof(adj1, axiom, ( adjacent(v1,v2) )).
fof(adj2, axiom, ( adjacent(v2,v3) )).
fof(adj3, axiom, ( adjacent(v3,v4) )).
fof(adj4, axiom, ( adjacent(v4,v5) )).
fof(no_same, axiom, ( ! [X,Y,C] : ((adjacent(X,Y) & color(X,C) & color(Y,C) => $false)) )).
fof(goal, conjecture, ( ? [C] : (color(v0,C)) )).
%------------------------------------------------------------------------------
