% Facts
response(john, hello, hi).
response(john, how_are_you, i_am_fine).
response(john, what_is_your_name, my_name_is_john).

response(mary, hello, hello_there).
response(mary, how_are_you, fantastic).
response(mary, what_is_your_name, i_am_mary).

% Rules
conversation(Person1, Person2, Question, Response) :-
    response(Person1, Question, Response1),
    response(Person2, Response1, Response).

% Example query
% ?- conversation(john, mary, hello, Response).
% Response = hello_there.
