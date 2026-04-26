fof(premise_0, axiom, (![X] : (meeting(X) => appearInCompany(X)))).
fof(premise_1, axiom, (![X] : (lunchInCompany(X) => meetings(X)))).
fof(premise_2, axiom, (![X] : (lunchInCompany(X) | lunchAtHome(X)))).
fof(premise_3, axiom, (![X] : (lunchAtHome(X) => workRemotelyFromHome(X)))).
fof(premise_4, axiom, (![X] : (inOtherCountries(X) => workRemotelyFromHome(X)))).
fof(premise_5, axiom, (![X] : (manager(X) => ~workRemotelyFromHome(X)))).
fof(premise_6, axiom, (manager(james) <~> appearInCompany(james))).
fof(conclusion, conjecture, ((manager(james) <~> inOtherCountries(james)) => (lunchAtHome(james) <~> workRemotelyFromHome(james)))).