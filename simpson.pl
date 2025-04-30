/* simpsons.pl - A Simple Knowledge Base about the Simpson Family */

% --- Facts ---

% Gender Facts
male(homer).
male(bart).
male(abe).
male(clancy).

female(marge).
female(lisa).
female(maggie).
female(mona).
female(jacqueline).

% Parentage Facts (Parent, Child)
parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).

parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(abe, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jacqueline, marge).

% --- Rules ---

% Basic Relationships
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
child(X, Y) :- parent(Y, X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

% Sibling Relationship (share a parent, not the same person)
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \== Y.

% Grandparent Relationship
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Ancestor Relationship (Recursive)
ancestor(X, Y) :- % Base case: parent is an ancestor
    parent(X, Y).
ancestor(X, Y) :- % Recursive step: parent of an ancestor is an ancestor
    parent(X, Z),
    ancestor(Z, Y).

/* End of simpsons.pl */
