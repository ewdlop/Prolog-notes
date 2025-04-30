likes(john, susie).                   /* John likes Susie */
likes(X, susie).                      /* Everyone likes Susie */
likes(john, Y)
likes(Y,john)

% Facts about people
person(john).
person(mary).
person(sue).
person(bob).
person(ann).
person(jim).
person(lisa).

% Gender facts
male(john).
male(bob).
male(jim).
female(mary).
female(sue).
female(ann).
female(lisa).

% Parent relationships
parent(john, sue).  % john is the parent of sue
parent(john, bob).  % john is the parent of bob
parent(mary, sue).  % mary is the parent of sue
parent(mary, bob).  % mary is the parent of bob
parent(sue, ann).   % sue is the parent of ann
parent(bob, jim).   % bob is the parent of jim
parent(bob, lisa).  % bob is the parent of lisa

% Rules for inferring relationships
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
child(X, Y) :- parent(Y, X).
son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).

% Sibling relationship
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Brother and sister relationships
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).

% Grandparent relationship
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).

% Ancestor relationship (recursive)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Uncle/Aunt relationships
uncle(X, Y) :- male(X), sibling(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), sibling(X, Z), parent(Z, Y).

% Cousin relationship
cousin(X, Y) :- parent(Z, X), parent(W, Y), sibling(Z, W).
