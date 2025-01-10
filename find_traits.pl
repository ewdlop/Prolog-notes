% Define character traits
character_trait('Logical Thinker', enjoys_puzzles).
character_trait('Empathetic', likes_helping_others).
character_trait('Risk Taker', adventurous).
character_trait('Independent', prefers_working_alone).
character_trait('Creative', enjoys_art).
character_trait('Knowledge Seeker', likes_reading).
character_trait('Tech Enthusiast', likes_technology).
character_trait('Active', likes_sports).
character_trait('Nocturnal', night_owl).
character_trait('Humorous', likes_making_others_laugh).
character_trait('Detective Mind', enjoys_solving_mysteries).

% Program to determine traits
find_traits :-
    write('Answer the following questions with "yes" or "no".'), nl,
    findall(Trait, (
        character_trait(Trait, Question),
        ask_question(Question)
    ), Traits),
    (   Traits = [] -> 
        write('No traits identified. You\'re a mystery!')
    ;   
        write('Your character traits are:'), nl,
        print_traits(Traits)
    ).

ask_question(Question) :-
    format('Do you ~w? (yes/no) ', [Question]),
    read(Answer),
    Answer = yes.

print_traits([]).
print_traits([Trait | Rest]) :-
    write('- '), write(Trait), nl,
    print_traits(Rest).
