% Define a dirty conscience as a state of guilt
dirty_conscience(Person) :-
    feels_guilt(Person),
    performed_unethical_action(Person).

% Example query
% ?- dirty_conscience(john).
% true.

% Define guilt-tripping as a form of manipulation
guilt_tripping(Person1, Person2) :-
    manipulate(Person1, Person2, guilt).
    
% Example query
% ?- guilt_tripping(john, mary).
% true.
