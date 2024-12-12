subject(they).
made_statement(unknown_speaker, some_statement).

heard(Subject, Statement) :- false.

glad(Subject) :-
    subject(Subject),
    made_statement(_, Statement),
    \+ heard(Subject, Statement).
