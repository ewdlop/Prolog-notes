% Knowledge acquisition through experience (Empiricism)
knowledge(born_tabula_rasa). % Humans are born as a blank slate.

% Sensory experience leads to knowledge
gain_knowledge(Experience, Knowledge) :-
    sensory_experience(Experience),
    infer_from_experience(Experience, Knowledge).

sensory_experience(see).
sensory_experience(hear).
sensory_experience(touch).
sensory_experience(taste).
sensory_experience(smell).

infer_from_experience(see, "Visual Understanding").
infer_from_experience(hear, "Auditory Understanding").
infer_from_experience(touch, "Tactile Understanding").
infer_from_experience(taste, "Gustatory Understanding").
infer_from_experience(smell, "Olfactory Understanding").

% Natural Rights
natural_right(life).
natural_right(liberty).
natural_right(property).

has_right(Person, Right) :-
    human(Person),
    natural_right(Right).

human(john).
human(mary).

% Social contract and government
government_exists :-
    people_agree(social_contract).

people_agree(social_contract) :-
    consensus(agree),
    social_contract_defined.

consensus(agree).
social_contract_defined.

% Justice and protection of rights
justice :-
    protect_rights.

protect_rights :-
    has_right(_, life),
    has_right(_, liberty),
    has_right(_, property).
