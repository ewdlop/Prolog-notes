% Prolog facts and rules illustrating safe query usage for graph databases

% safe_query(+Language, +QueryParameters)
% Ensures that parameterized queries are used instead of direct string concatenation.
safe_query(cypher, Params) :-
    valid_params(Params),
    \+ malicious(Params).

safe_query(gremlin, Params) :-
    valid_params(Params),
    \+ malicious(Params).

% valid_params/1 checks if parameters meet certain criteria
valid_params([]).
valid_params([Param|T]) :-
    not_contains_illegal_characters(Param),
    valid_params(T).

% malicious/1 would define patterns recognized as malicious
malicious(Params) :- member("DROP", Params); member("REMOVE", Params).
