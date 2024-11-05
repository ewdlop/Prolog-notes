% Define some intrusive thoughts
thought('doubt').
thought('fear of failure').
thought('unwanted memories').
thought('worry about future').

% Define triggers for these thoughts
trigger('stress', 'doubt').
trigger('anxiety', 'fear of failure').
trigger('past trauma', 'unwanted memories').
trigger('uncertainty', 'worry about future').

% Define relationships between thoughts
related('doubt', 'fear of failure').
related('fear of failure', 'worry about future').
related('unwanted memories', 'fear of failure').

% Define how certain events can increase the frequency of thoughts
increased_by('stress', 'doubt').
increased_by('uncertainty', 'worry about future').

% Define thoughts that are harder to dismiss or persistent
persistent('doubt').
persistent('unwanted memories').
