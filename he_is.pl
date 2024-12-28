% Facts
he_is(he).
he_is(I).

% Rules
he_is(them) :- he_is(he), he_is(I).

% Query
?- he_is(them).
