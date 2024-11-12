% Facts
wealthy(king).
wealthy(queen).
wealthy(noble).

% Rules
money_god_grants_wealth(X) :-
    righteous(X),
    hardworking(X),
    not_greedy(X).

% Define characteristics
righteous(alex).
hardworking(alex).
not_greedy(alex).

righteous(mia).
hardworking(mia).
not_greedy(mia).

% Sample queries
% You can query who the Money God grants wealth to:
% ?- money_god_grants_wealth(X).
% Expected output: X = alex ; X = mia.

% Or check if a specific person is granted wealth:
% ?- money_god_grants_wealth(alex).
% Expected output: true
% ?- money_god_grants_wealth(king).
% Expected output: false (assuming king is wealthy but not necessarily righteous, hardworking, or not greedy).
