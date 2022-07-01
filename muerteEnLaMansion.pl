
% -- PUNTO 1 --

% esPersona es un generador
esPersona(tiaAgatha).
esPersona(mayordomo).
esPersona(charles).

esCharles(charles).

esMayordomo(mayordomo).

esTiaAgatha(tiaAgatha).

viveEnLaMansionDreadbury(tiaAgatha).
viveEnLaMansionDreadbury(mayordomo).
viveEnLaMansionDreadbury(charles).

matoATiaAgatha(Alguien) :-
    viveEnLaMansionDreadbury(Alguien),
    odiaA(Alguien, tiaAgatha),
    not(esMasRicoQueTiaAgatha(Alguien)).

odiaA(Odiador, Alguien) :-
    charlesOdiaA(Odiador, Alguien);
    mayordomoOdiaA(Odiador, Alguien);
    tiaAgathaOdiaA(Odiador, Alguien).

charlesOdiaA(Odiador, Alguien) :-
    esCharles(Odiador),
    viveEnLaMansionDreadbury(Alguien),
    Odiador \= Alguien,
    not(tiaAgathaOdiaA(tiaAgatha, Alguien)).

tiaAgathaOdiaA(Odiador, Alguien) :-
    esTiaAgatha(Odiador),
    viveEnLaMansionDreadbury(Alguien),
    Alguien \= mayordomo,
    Odiador \= Alguien.

esMasRicoQueTiaAgatha(Alguien):-
    esPersona(Alguien),
    not(mayordomoOdiaA(mayordomo, Alguien)),
    viveEnLaMansionDreadbury(Alguien).

mayordomoOdiaA(Odiador, Alguien) :-
    esMayordomo(Odiador),
    tiaAgathaOdiaA(tiaAgatha, Alguien),
    Odiador \= Alguien.

% -- PUNTO 2 --

% a) odiaA(Alguien, milhouse)
% b) odiaA(charles, Alguien)
% c) odiaA(Alguien, tiaAgatha)
% d) odiaA(Odiador, Odiado)
% e) odiaA(mayordomo, _)

% No se por qué pero en la regla tiaAgathaOdiaA es verdadera con charles pero al hacer la 
% consulta existencial odiaA(Odiador, Odiado) no devuelve que tiaAgatha odia a charles.