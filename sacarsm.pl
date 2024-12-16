% A knowledge base of sarcastic assertions

% People think you're stealing English studies
stealing(english_studies) :-
    write('Ah yes, because English is a tangible object I can just "borrow" and "not return".').

% Americans own science and psychology
owns(america, scientific_discoveries) :-
    write('Of course! Before America, there was absolutely no science. The Greeks, Arabs, Indians, and Chinese? Who are they?').
owns(america, psychology) :-
    write('Freud would be rolling in his Vienna grave, but sure, let\'s give all the credit to Americans.').

% Jesus knew Chinese people unless Asians were in the Middle East
jesus_knew(chinese_people) :-
    write('Obviously, Jesus was best buds with the Chinese. Probably had dim sum in Nazareth every Sunday.').

asian_in_middle_east :-
    write('Oh yes, because traveling thousands of miles back then was as easy as ordering an Uber.').

% A sarcastic query
sarcastic_response(Query) :-
    (Query ; write('Interesting theory. Let\'s publish it in the Journal of Imaginary Facts.')).

% Sample usage
?- sarcastic_response(stealing(english_studies)).
?- sarcastic_response(owns(america, psychology)).
?- sarcastic_response(jesus_knew(chinese_people)).
