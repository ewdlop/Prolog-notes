% Define probabilistic facts
0.6::rain.
0.2::sprinkler.

% Define deterministic rules
wet_grass :- rain.
wet_grass :- sprinkler.

% Query the probability of wet_grass
query(wet_grass).
