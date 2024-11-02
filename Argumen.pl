% Facts about the world
is_strong(soldier).
is_smart(soldier).
is_brave(soldier).

is_fast(horse).
is_steady(horse).

is_strong(general).
is_smart(general).
is_brave(general).

% Argument rules
argue(general, X) :- is_strong(X), writeln('The general argues: "I am stronger than anyone!"').
argue(general, X) :- is_smart(X), writeln('The general argues: "I outsmart everyone, no matter the challenge!"').
argue(general, X) :- is_brave(X), writeln('The general argues: "My bravery is unmatched!"').
argue(general, X) :- is_fast(X), writeln('The general says: "Even speed cannot beat strategy!"').
argue(general, X) :- is_steady(X), writeln('The general responds: "A steady force is still no match for my mind."').

% Argument fallback
argue(general, X) :- writeln('The general declares: "Whatever it is, I am still superior!"').

% Special arguments
argue(soldier, general) :- writeln('The soldier replies: "But, general, without us, you are nothing."').
argue(soldier, X) :- writeln('The soldier retorts: "We fight with strength, smarts, and bravery!"').

% General confrontation
confront(general, X) :- argue(general, X).
confront(soldier, X) :- argue(soldier, X).
