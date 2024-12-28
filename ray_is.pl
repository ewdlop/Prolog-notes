% Facts
ray_is(me).
ray_is(you).

% Rules
ray_is(both) :- ray_is(me), ray_is(you).

% Query
?- ray_is(both).
