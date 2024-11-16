% Facts about social expectations
social_expectation(individual, "Expectation from individuals based on societal norms.").
social_expectation(group, "Expectation from groups or communities based on collective norms.").

% Social expectations as an agenda
agenda("Social Expectations", purpose("Guides behavior in society.")).
agenda("Social Expectations", mechanism("Shapes interactions among individuals.")).

% Rules for identifying conflicts between expectations and agendas
conflict(Expected, Actual) :-
    social_expectation(Type, Expected),
    agenda("Social Expectations", mechanism(Actual)),
    Expected \= Actual.

% Example queries
% What is the purpose of "Social Expectations" as an agenda?
% ?- agenda("Social Expectations", purpose(Purpose)).

% Are there conflicts between individual expectations and agenda mechanisms?
% ?- conflict(Expected, "Shapes interactions among individuals.").

% Listing social expectations for individuals and groups
% ?- social_expectation(Type, Description).
