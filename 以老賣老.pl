% -----------------------------
% Prolog Knowledge Base for 「以老賣老」
% -----------------------------

% Facts

% person(Name, SeniorityLevel).
% SeniorityLevel is an integer where a higher number indicates higher seniority.
person(alice, 5).
person(bob, 3).
person(charlie, 4).
person(diana, 2).
person(edward, 1).

% authority(Assertor, Target).
% Assertor asserts authority over Target based on seniority.
authority(alice, bob).      % Alice asserts authority over Bob
authority(charlie, diana).  % Charlie asserts authority over Diana

% shows_off(Person, Attribute).
% Person shows off their seniority through a specific attribute or behavior.
shows_off(alice, experience).
shows_off(charlie, achievements).

% Rules

% yi_laomailao(Assertor, Target).
% Represents the concept of 「以老賣老」 where Assertor relies on seniority to assert authority over Target.
yi_laomailao(Assertor, Target) :-
    authority(Assertor, Target),
    shows_off(Assertor, _).

% Additional Rules for Dynamic Relationships

% higher_seniority(Person1, Person2).
% Person1 has higher seniority than Person2.
higher_seniority(Person1, Person2) :-
    person(Person1, Level1),
    person(Person2, Level2),
    Level1 > Level2.

% assert_authority_based_on_seniority(Assertor, Target).
% Assertor asserts authority over Target if they have higher seniority.
assert_authority_based_on_seniority(Assertor, Target) :-
    higher_seniority(Assertor, Target),
    Assertor \= Target.

% show_off_seniority(Person).
% Person shows off their seniority in some way.
show_off_seniority(Person) :-
    shows_off(Person, _).

% Combined Rule for 「以老賣老」
yi_laomailao_combined(Assertor, Target) :-
    assert_authority_based_on_seniority(Assertor, Target),
    show_off_seniority(Assertor).

% -----------------------------
% Sample Queries
% -----------------------------

% 1. Find all instances of 「以老賣老」.
% ?- yi_laomailao(Assertor, Target).
% Expected Output:
% Assertor = alice,
% Target = bob ;
% Assertor = charlie,
% Target = diana.

% 2. Find all individuals who assert authority based on seniority.
% ?- authority(Assertor, Target).
% Expected Output:
% Assertor = alice,
% Target = bob ;
% Assertor = charlie,
% Target = diana.

% 3. Find all individuals who show off their seniority.
% ?- shows_off(Person, Attribute).
% Expected Output:
% Person = alice,
% Attribute = experience ;
% Person = charlie,
% Attribute = achievements.

% 4. Using the combined rule.
% ?- yi_laomailao_combined(Assertor, Target).
% Expected Output:
% Assertor = alice,
% Target = bob ;
% Assertor = charlie,
% Target = diana.
