% ==========================================
% Lab 5 - Task 1
% The Simpsons Family Tree
% ==========================================

% ----- Male Facts -----

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% ----- Female Facts -----

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ----- Parent Facts -----

parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).


% ==========================================
% Rules
% ==========================================

% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% Sister
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

% Grandfather
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

% Aunt
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

% Uncle
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

% Ancestor - Base Case
ancestor(X, Y) :-
    parent(X, Y).

% Ancestor - Recursive Case
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
