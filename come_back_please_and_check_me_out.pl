% Define a "comeback" rule based on specific conditions.
comeback(Person) :-
    improved_skill(Person),
    resolved_conflict(Person),
    has_support(Person).

% Facts about a person's state
improved_skill(john).
resolved_conflict(john).
has_support(john).

% Query example:
% ?- comeback(john).
% true.

% If any condition isn't met:
% ?- comeback(mary).
% false.


% Let me check and get back to you
