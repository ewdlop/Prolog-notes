% Facts: Basic beliefs, actions, and scenarios
belief(john, "Honesty is important.").              % John believes honesty is important.
action(john, "Lied to his friend.").                % John lied to his friend.
conflict(john, "Belief conflicts with action.").    % John's belief conflicts with his action.

belief(susan, "Exercise is essential for health."). % Susan believes exercise is important.
action(susan, "Rarely exercises.").                % Susan rarely exercises.
conflict(susan, "Belief conflicts with action.").   % Susan's belief conflicts with her lifestyle.

belief(mary, "Everyone deserves kindness.").        % Mary believes in universal kindness.
action(mary, "Argued aggressively with a stranger."). % Mary argued aggressively.
conflict(mary, "Belief conflicts with action.").    % Mary's belief conflicts with her behavior.

% Rules: Identifying cognitive dissonance
cognitive_dissonance(X) :-
    belief(X, Belief),
    action(X, Action),
    conflict(X, Conflict),
    write(X), write(' is experiencing cognitive dissonance: '), nl,
    write('Belief: '), write(Belief), nl,
    write('Action: '), write(Action), nl,
    write('Conflict: '), write(Conflict), nl.

% Strategies to resolve cognitive dissonance
resolve_dissonance(X) :-
    cognitive_dissonance(X),
    write('Strategies to resolve cognitive dissonance for '), write(X), write(':'), nl,
    write('- Adjust belief to align with action.'), nl,
    write('- Change action to align with belief.'), nl,
    write('- Justify action to reduce conflict.'), nl.

% Example Scenarios
% Scenario 1: John lied despite valuing honesty.
scenario1 :-
    write('Scenario 1: John and Honesty'), nl,
    cognitive_dissonance(john),
    resolve_dissonance(john).

% Scenario 2: Susan avoids exercise despite valuing health.
scenario2 :-
    write('Scenario 2: Susan and Exercise'), nl,
    cognitive_dissonance(susan),
    resolve_dissonance(susan).

% Scenario 3: Mary acted aggressively despite valuing kindness.
scenario3 :-
    write('Scenario 3: Mary and Kindness'), nl,
    cognitive_dissonance(mary),
    resolve_dissonance(mary).

% Adding flexibility: What if the person resolves the conflict?
resolve_conflict(X) :-
    belief(X, Belief),
    retract(action(X, _)),
    asserta(action(X, "Aligned actions with belief.")),
    write(X), write(' resolved their cognitive dissonance by aligning actions with the belief: '), write(Belief), nl.


% Facts: Beliefs and actions of two people
belief(john, "Honesty is the best policy.").    % John believes in honesty.
action(john, "Lied to Mary.").                 % John lied to Mary.

belief(mary, "Trust is essential in relationships.").  % Mary believes in trust.
action(mary, "Confronted John aggressively.").         % Mary acted against her belief in trust.

% Conflict between two people
relationship_conflict(john, mary) :-
    belief(john, Belief1),
    action(john, Action1),
    belief(mary, Belief2),
    action(mary, Action2),
    write('John and Mary are experiencing cognitive dissonance in their relationship:'), nl,
    write('John\'s Belief: '), write(Belief1), nl,
    write('John\'s Action: '), write(Action1), nl,
    write('Mary\'s Belief: '), write(Belief2), nl,
    write('Mary\'s Action: '), write(Action2), nl.

% Resolution strategies for both parties
resolve_relationship_conflict(X, Y) :-
    relationship_conflict(X, Y),
    write('Strategies for resolving conflict between '), write(X), write(' and '), write(Y), write(':'), nl,
    write('- Openly communicate about each other\'s beliefs and actions.'), nl,
    write('- Adjust actions to align with mutual beliefs.'), nl,
    write('- Seek understanding and compromise to reduce dissonance.'), nl.

% Example Queries:
% ?- relationship_conflict(john, mary).
% ?- resolve_relationship_conflict(john, mary).


who_has_dissonance(X, Y) :-
    belief(X, Belief1), action(X, Action1),
    belief(Y, Belief2), action(Y, Action2),
    (conflict(X, Belief1, Action1) ; conflict(Y, Belief2, Action2)),
    write(X), write(' or '), write(Y), write(' has cognitive dissonance.\n').


% Facts: Assign conflict intensity based on beliefs and actions
conflict_level(john, mary, high).    % John and Mary have a high level of conflict.
conflict_level(susan, paul, medium). % Susan and Paul have a medium level of conflict.
conflict_level(anna, mike, low).     % Anna and Mike have a low level of conflict.

% Rules: Assess conflict level
evaluate_conflict_level(X, Y) :-
    conflict_level(X, Y, Level),
    write('The conflict level between '), write(X), write(' and '), write(Y), write(' is '), write(Level), write('.\n').

% Rule: Suggest resolution actions based on conflict level
suggest_resolution(X, Y) :-
    conflict_level(X, Y, high),
    write('Conflict is HIGH between '), write(X), write(' and '), write(Y), write('. Immediate resolution needed:'), nl,
    write('- Mediation by a neutral third party.'), nl,
    write('- Honest discussion about beliefs and actions.'), nl,
    write('- Mutual commitments to change behaviors.'), nl.

suggest_resolution(X, Y) :-
    conflict_level(X, Y, medium),
    write('Conflict is MEDIUM between '), write(X), write(' and '), write(Y), write('. Suggested actions:'), nl,
    write('- Open communication to clarify misunderstandings.'), nl,
    write('- Small adjustments in actions to align with beliefs.'), nl,
    write('- Regular check-ins to avoid escalation.'), nl.

suggest_resolution(X, Y) :-
    conflict_level(X, Y, low),
    write('Conflict is LOW between '), write(X), write(' and '), write(Y), write('. Maintenance actions:'), nl,
    write('- Ensure ongoing communication.'), nl,
    write('- Address minor disagreements before they escalate.'), nl,
    write('- Reinforce positive behaviors and mutual understanding.'), nl.

% Example Queries:
% ?- evaluate_conflict_level(john, mary).
% ?- suggest_resolution(john, mary).
% ?- suggest_resolution(anna, mike).



