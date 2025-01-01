% Define a fact for eggs and bones
contains(egg, no_bones).
contains(egg, some_faults).

% Define a predicate for nitpicking behavior
nitpicking(Person, Object) :-
    contains(Object, no_bones),
    write(Person), write(' is nitpicking: looking for faults in '), write(Object), write(' which has no issues.'), nl.

nitpicking(Person, Object) :-
    contains(Object, some_faults),
    write(Person), write(' is nitpicking: overly critical about minor issues in '), write(Object), nl.

% Example query
% ?- nitpicking(john, egg).
% Output:
% john is nitpicking: looking for faults in egg which has no issues.
% or
% john is nitpicking: overly critical about minor issues in egg.
