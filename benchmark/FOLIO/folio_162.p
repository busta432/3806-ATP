fof(premise_0, axiom, (likesMusic(george) => wantsToCompose(george))).
fof(premise_1, axiom, (accesstoProgram(george) => canCompose(george))).
fof(premise_2, axiom, ((wantsToCompose(george) & canCompose(george)) => willCompose(george))).
fof(conclusion, conjecture, ((likesMusic(george) & accesstoProgram(george)) => willCompose(george))).