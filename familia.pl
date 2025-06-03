% Varones
varon(antony).
varon(douglas).
varon(juan_carlos).
varon(felipe).
varon(rodolfo).
varon(wilson).
varon(grover).
% Mujeres
mujer(eustaquia).
mujer(alicia).
mujer(rosnely).
mujer(norma).
mujer(yovana).
mujer(yoselin).
% Padre
padre(felipe, grover).
padre(felipe, alicia).
padre(felipe, rosnely).
padre(felipe, rodolfo).
padre(felipe, norma).
padre(felipe, wilson).
padre(felipe, yovana).
padre(juan_carlos, douglas).
padre(juan_carlos, antoni).
padre(juan_carlos, yoselin).

% Madre
madre(eustaquia, grover).
madre(eustaquia, alicia).
madre(eustaquia, rosnely).
madre(eustaquia, rodolfo).
madre(eustaquia, norma).
madre(eustaquia, wilson).
madre(eustaquia, yovana).
madre(alicia, douglas).
madre(alicia, antoni).
madre(alicia, yoselin).


% Reglas de relación familiar
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

hermano(X, Y) :-
    padre(P, X), padre(P, Y),
    madre(M, X), madre(M, Y),
    X \= Y,
    varon(X).

hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

abuelo(X, Y) :-
    padre(X, Z),
    progenitor(Z, Y).

tio(X, Y) :-
    progenitor(P, Y),
    hermano(X, P).

sobrino(X, Y) :-
    tio(Y, X),
    varon(X).

nieto(X, Y) :-
    progenitor(Y, Z),
    progenitor(Z, X),
    varon(X).
