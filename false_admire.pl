% Facts: Basic information about people and their behaviors
admires(john, mary).          % John claims to admire Mary.
frequent_praise(john, mary).  % John frequently praises Mary.
requests_favors(john, mary).  % John often asks Mary for favors.
shares_genuine_support(jane, mary).  % Jane shows genuine support for Mary.
undermines_trust(john, mary). % John discredits Mary behind her back.
opportunistic_behavior(john). % John shows opportunistic behavior.

% Rules to identify manipulation
pretending_to_be_fan(X, Y) :-
    admires(X, Y),
    frequent_praise(X, Y),
    requests_favors(X, Y),
    undermines_trust(X, Y),
    opportunistic_behavior(X),
    write(X), write(' might be pretending to be a fan of '), write(Y),
    write(' while actually trying to manipulate or exploit them.\n').

genuine_support(X, Y) :-
    admires(X, Y),
    shares_genuine_support(X, Y),
    \+ requests_favors(X, Y),
    \+ undermines_trust(X, Y),
    write(X), write(' genuinely supports '), write(Y), write('.\n').

% Testing trustworthiness of a fan
fan_trustworthy(X, Y) :-
    genuine_support(X, Y), !;
    \+ pretending_to_be_fan(X, Y),
    write(X), write(' appears to be a trustworthy fan of '), write(Y), write('.\n').

% Example queries to evaluate relationships
% ?- pretending_to_be_fan(john, mary).  % Check if John is pretending to be a fan of Mary.
% ?- genuine_support(jane, mary).      % Verify if Jane genuinely supports Mary.
% ?- fan_trustworthy(john, mary).      % Assess if John can be trusted as a fan.
% ?- fan_trustworthy(jane, mary).      % Assess if Jane is a trustworthy fan.
