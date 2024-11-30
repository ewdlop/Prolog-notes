assume_and_accuse(Person) :-
    assumes(Person, Something),
    believes(Person, others_assume(Something)),
    accuses(Person, Others, assumes(Something)).
