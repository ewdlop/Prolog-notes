% Facts
likes(john, tea).       % Oh, John likes tea. How original.
likes(mary, coffee).     % Mary likes coffee because she's *so unique*.
likes(susan, matcha).    % Susan is all about matcha because it’s “trendy.”
likes(james, tea).       % James also likes tea because apparently, individuality is overrated.

% Rules
compatible(X, Y) :-
    likes(X, Z), likes(Y, Z), X \= Y,  % Compatibility is just sharing a drink, right? Sure.
    write('I guess '), write(X), write(' and '), write(Y), write(' are compatible because they both like '), write(Z), write('.\n').

self_conflicted(X) :-
    likes(X, tea), likes(X, coffee),  % Pick a side, X. Tea or coffee? Can't have both.
    write(X), write(' likes both tea and coffee, but let’s pretend that’s not confusing.\n').

% Adding a rule to handle people who “don’t like anything.”
likes_nothing(X) :-
    \+ likes(X, _), % Oh, so they’re just too special to like anything. How edgy.
    write(X), write(' likes *nothing*. Absolutely nothing. '), write('We’re so impressed.\n').

% Queries
% Just asking these questions might cause Prolog to roll its eyes.
% ?- compatible(john, james). % Oh, look, the tea drinkers unite. What a plot twist.
% ?- self_conflicted(mary).   % As if Mary isn’t already confusing enough.
% ?- likes_nothing(karen).    % Of course Karen doesn’t like anything. Why are we even surprised?
