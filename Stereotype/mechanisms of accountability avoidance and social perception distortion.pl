% Psychological Mechanisms Knowledge Base

% Diffusion of Responsibility
mechanism(diffusion_of_responsibility, 
    description("Avoiding accountability or feeling less responsible because others are involved."),
    example("It's not my fault because someone else assumes responsibility or takes the blame.")
).

% Disassociation
mechanism(disassociation, 
    description("Detaching oneself from their own actions or identity."),
    example("It's not me; it’s someone else’s issue or assumption.")
).

% Cognitive Dissonance
mechanism(cognitive_dissonance, 
    description("Discomfort arising when actions or beliefs contradict one’s identity."),
    example("Shifting responsibility or blame to align with their self-perception.")
).

% Projection
mechanism(projection, 
    description("Attributing one’s own thoughts, feelings, or behaviors to others."),
    example("It’s not me; it’s them.")
).

% Plausible Deniability
mechanism(plausible_deniability, 
    description("Continuing actions while justifying them through others' assumptions."),
    example("If others assume it, then I can act without owning up to it.")
).

% Self-Justification through Assumption
mechanism(self_justification_assumption, 
    description("Rationalizing behavior because someone else's assumptions make it seem acceptable."),
    example("Since they think it’s this way, I might as well act as if it is.")
).

% Social Confirmation Bias
mechanism(social_confirmation_bias, 
    description("Modifying behavior or justifying it because others’ beliefs or assumptions validate it."),
    example("Their beliefs make my actions feel justified.")
).

% Gaslighting
mechanism(gaslighting, 
    description("Denying involvement and attributing the action to someone else to manipulate perception."),
    example("Making others question reality by blaming someone else.")
).

% False Attribution
mechanism(false_attribution, 
    description("Deliberately crediting or blaming someone else for an action."),
    example("Blaming someone else to reject responsibility or diminish their credibility.")
).

% Deflection
mechanism(deflection, 
    description("Shifting attention away from one’s accountability by blaming others."),
    example("They did it, not me.")
).

% Presumptive Guilt
mechanism(presumptive_guilt, 
    description("Judging someone based on assumptions without evidence."),
    example("When you clarify, they claim they 'got you' despite lack of proof.")
).

% False Presumption of Intent
mechanism(false_presumption_of_intent, 
    description("Assuming someone was going to do something without evidence."),
    example("Interpreting defensive behavior as confirmation of false assumptions.")
).

% Defensive Projection
mechanism(defensive_projection, 
    description("Attributing one's own thoughts or suspicions to others."),
    example("Claiming to 'know' what someone was thinking based on biases.")
).

% Self-Fulfilling Misunderstanding
mechanism(self_fulfilling_misunderstanding, 
    description("Using reactions provoked by false assumptions to justify the original assumption."),
    example("Their reaction 'proves' what I assumed, even if it was false.")
).

% Query Examples
% List all mechanisms with descriptions and examples.
?- mechanism(Name, description(Description), example(Example)).
