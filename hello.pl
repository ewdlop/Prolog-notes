% Facts
% Define responses for John
response(john, hello, hi). % John responds with 'hi' when greeted with 'hello'
response(john, how_are_you, i_am_fine). % John responds with 'i am fine' when asked 'how are you'
response(john, what_is_your_name, my_name_is_john). % John responds with 'my name is john' when asked 'what is your name'

% Define responses for Mary
response(mary, hello, hello_there). % Mary responds with 'hello there' when greeted with 'hello'
response(mary, how_are_you, fantastic). % Mary responds with 'fantastic' when asked 'how are you'
response(mary, what_is_your_name, i_am_mary). % Mary responds with 'i am mary' when asked 'what is your name'

% Rules
% Define a conversation rule where Person1 asks a question and Person2 responds
conversation(Person1, Person2, Question, Response) :-
    response(Person1, Question, Response1), % Person1's response to the question
    response(Person2, Response1, Response). % Person2's response to Person1's response

% Example queries
% Query to find out how Mary responds to John's greeting
% ?- conversation(john, mary, hello, Response).
% Response = hello_there.

% Query to find out how John responds to Mary's question about his name
% ?- conversation(mary, john, what_is_your_name, Response).
% Response = my_name_is_john.

% Query to find out how Mary responds to John's question about her well-being
% ?- conversation(john, mary, how_are_you, Response).
% Response = fantastic.

% Additional sample queries to demonstrate usage
% Query to find out how John responds to Mary's greeting
% ?- conversation(mary, john, hello, Response).
% Response = hi.

% Query to find out how John responds to Mary's question about his well-being
% ?- conversation(mary, john, how_are_you, Response).
% Response = i_am_fine.

% Query to find out how Mary responds to John's question about her name
% ?- conversation(john, mary, what_is_your_name, Response).
% Response = i_am_mary.
