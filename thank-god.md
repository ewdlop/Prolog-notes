% This knowledge base represents a situation where 'they' are glad that 'she' did not learn more from 'me'.

% Facts:
subject(they).
person(she).
source(me).

% She did not learn more from me:
learned_more(she, me) :- false.

% They are glad about this fact:
glad(they) :-
    subject(they),
    person(she),
    source(me),
    \+ learned_more(she, me).
