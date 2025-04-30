/* =======================================================
 * Simple Knowledge Base: Common Fruits and Their Attributes
 * Domain: Basic properties of a few common fruits.
 * Purpose: Demonstrates basic Prolog facts and rules.
 * =======================================================
 */

% === FACTS ===
% Define the basic entities and their properties.
% It's good practice to group facts by predicate.

% --- fruit/1 Facts ---
% Defines which entities are considered fruits in this KB.
fruit(apple).
fruit(banana).
fruit(lemon).
fruit(grape).
fruit(orange).

% --- color/2 Facts ---
% Defines the typical color of each fruit.
% color(Fruit, Color)
color(apple, red).
color(banana, yellow).
color(lemon, yellow).
color(grape, purple).
color(orange, orange). % Note: 'orange' is both a fruit and a color atom.

% --- taste/2 Facts ---
% Defines the typical taste of each fruit (simplified).
% taste(Fruit, Taste)
taste(apple, sweet).
taste(banana, sweet).
taste(lemon, sour).
taste(grape, sweet).
taste(orange, sweet).

% --- grows_on/2 Facts ---
% Defines where specific fruits grow.
% grows_on(Fruit, LocationType)
grows_on(apple, tree).
grows_on(grape, vine).
grows_on(banana, plant). % Bananas grow on large herbaceous plants.
grows_on(orange, tree).


% === RULES ===
% Define relationships and derived properties based on facts.

% --- is_sweet_fruit/1 Rule ---
% Purpose: To determine if a given entity X is a sweet fruit.
% Logic: X is a sweet fruit if X is a fruit AND X tastes sweet.
is_sweet_fruit(X) :-
    fruit(X),       % Check if X is listed as a fruit
    taste(X, sweet). % Check if the taste of X is sweet

% --- is_yellow/1 Rule ---
% Purpose: To determine if a given entity X is yellow.
% Logic: X is yellow if its color is yellow.
is_yellow(X) :-
    color(X, yellow).

% --- is_sweet_and_yellow/1 Rule ---
% Purpose: To determine if a given entity X is both sweet and yellow.
% Logic: X is sweet and yellow if it satisfies is_sweet_fruit(X) AND is_yellow(X).
% Note: This rule demonstrates using other rules as conditions.
is_sweet_and_yellow(X) :-
    is_sweet_fruit(X),
    is_yellow(X).

% --- grows_somewhere/1 Rule ---
% Purpose: To determine if an entity X grows on any known location type.
% Logic: X grows somewhere if there is any fact grows_on(X, Place).
% The anonymous variable '_' indicates we don't care about the specific place.
grows_somewhere(X) :-
    grows_on(X, _).

% --- is_citrus/1 Rules ---
% Purpose: To determine if a fruit X is citrus (lemon or orange in this KB).
% Logic: X is citrus if it's a fruit AND (X is lemon OR X is orange).
% Implemented using two separate rules for clarity (representing OR).
is_citrus(X) :-
    fruit(X),
    X = lemon. % '=' is the unification operator

is_citrus(X) :-
    fruit(X),
    X = orange.

/* End of Knowledge Base */
