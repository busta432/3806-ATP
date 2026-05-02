%------------------------------------------------------------------------------
% File     : PUZ934+1
% Domain   : Puzzles
% Problem  : widget has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(widget_yellow, axiom, ( ! [X] : ((widget(X) => yellow(X))) )).
fof(widget_compact, axiom, ( ! [X] : ((widget(X) => compact(X))) )).
fof(widget_portable, axiom, ( ! [X] : ((widget(X) => portable(X))) )).
fof(inst, axiom, ( widget(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
