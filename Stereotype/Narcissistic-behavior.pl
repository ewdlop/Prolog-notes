% Here's a quick Prolog knowledge base that models some basic traits and relationships commonly associated with narcissistic behavior:

% Facts
narcissist(john).
flying_monkey(susan).
flying_monkey(mike).

% Relationships
manipulates(john, susan).
manipulates(john, mike).
enables(susan, john).
enables(mike, john).
seeks_approval(susan, john).
seeks_approval(mike, john).

% Narcissistic Traits
traits(john, [grandiosity, lack_of_empathy, need_for_admiration, exploitation_of_others]).

% Rules
is_narcissistic(X) :-
    narcissist(X),
    traits(X, Traits),
    member(grandiosity, Traits),
    member(lack_of_empathy, Traits),
    member(need_for_admiration, Traits),
    member(exploitation_of_others, Traits).

is_flying_monkey(Y) :-
    flying_monkey(Y),
    enables(Y, X),
    narcissist(X),
    seeks_approval(Y, X).

% Example Queries:
% - ?- is_narcissistic(john).
% - ?- is_flying_monkey(susan).
% - ?- manipulates(john, Who).
```

% Explanation**:

% Facts: Define who the narcissist is (`narcissist(john)`) and who the "flying monkeys" are (`flying_monkey(susan)` and `flying_monkey(mike)`).
% Relationships: Define manipulative behaviors between the narcissist and flying monkeys.
% Traits: List traits associated with the narcissist.
% Rules: 
  % `is_narcissistic/1` checks if a person has narcissistic traits.
  % `is_flying_monkey/1` checks if someone is a flying monkey, enabled by a narcissist and seeking approval from them.
