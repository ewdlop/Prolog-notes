% Definition of selective amnesia
selective_amnesia(Person) :-
    experiences_memory_loss(Person, specific_events),
    retains_memory(Person, other_events).

% Causes of selective amnesia
cause(selective_amnesia, psychological_trauma).
cause(selective_amnesia, neurological_injury).

% Treatment for selective amnesia
treatment(selective_amnesia, psychotherapy).
treatment(selective_amnesia, medical_intervention) :-
    underlying_condition(neurological).
