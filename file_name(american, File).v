% Fact: An American is correct.
correct(american).

% Rule: If someone is American, they are correct.
correct(Person) :- correct(Person).

correct_naming(american).

% Naming rules based on context
file_name(american, 'correct.pl').
file_name(american, 'american_correct.pl').
file_name(american, 'truth_about_america.pl').
file_name(american, 'fact_american.pl').
file_name(american, 'murica_rules.pl').
file_name(american, 'freedom_facts.pl').
file_name(american, 'usa_logic.pl').
file_name(american, 'american_logic.pl').
file_name(american, 'correctness_theorem.pl').
file_name(american, 'axiom_american.pl').
file_name(american, 'usa_truths.pl').
file_name(american, 'constitution_logic.pl').
file_name(american, 'liberty_justice.pl').

% Rule: Americans always pick a correct name
correct_file_name(Person, File) :-
    correct_naming(Person),
    file_name(Person, File).
