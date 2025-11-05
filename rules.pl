:- dynamic obs/2.
:- dynamic regra_ativa/1.

% meta/2 -> resultado + plano recomendado
meta(resultado(Regras), PlanoFinal) :-
    retractall(regra_ativa(_)),
    findall(Regra, (
        (
          regra(Regra, Plano)
        ),
        assertz(regra_ativa(Regra)),
        assertz(obs(Regra, Plano))
    ), Regras),
    melhor_plano(Regras, PlanoFinal).

% --------------------------
% Regras de recomendação
% --------------------------

regra(muito_dados, ilimitado_total) :-
    obs(dados_gb, GB), GB >= 50.

regra(muitos_minutos, ilimitado_voz) :-
    obs(minutos, M), M >= 1000.

regra(uso_alto_geral, plus) :-
    obs(minutos, M), M >= 500,
    obs(dados_gb, GB), GB >= 8.

regra(preferencia_controle_baixo, controle_pequeno) :-
    obs(preferencia_controle, sim),
    obs(minutos, M), M =< 60,
    obs(dados_gb, GB), GB =< 1.

regra(preferencia_controle_medio, controle_medio) :-
    obs(preferencia_controle, sim),
    obs(minutos, M), M > 60, M =< 250,
    obs(dados_gb, GB), GB =< 3.

regra(muitos_sms, plus) :-
    obs(sms, S), S >= 400.

regra(uso_roaming, roaming_fixo) :-
    obs(minutos_roaming, MR), MR >= 10,
    obs(dados_roaming_gb, DR), DR >= 1,
    obs(orcamento_max, B), B >= 50.

regra(orcamento_baixo, controle_pequeno) :-
    obs(orcamento_max, B), B > 0, B < 18.

regra(orcamento_medio, basico) :-
    obs(orcamento_max, B), B >= 18, B < 30.

regra(preferencia_dados_alto, plus) :-
    obs(preferencia_dados, sim),
    obs(dados_gb, GB), GB >= 6.

regra(uso_zero, controle_pequeno) :-
    obs(minutos, 0),
    obs(dados_gb, 0),
    obs(sms, 0).

% --------------------------
% Escolher plano final
% --------------------------

melhor_plano([], basico).
melhor_plano(Regras, PlanoFinal) :-
    findall(P, (member(R, Regras), obs(R, P)), Planos),
    mode(Planos, PlanoFinal).

% modo: retorna elemento mais frequente
mode(List, Mode) :-
    msort(List, Sorted),
    pack(Sorted, Packed),
    keysort(Packed, SortedPairs),
    reverse(SortedPairs, [_-Mode|_]).

pack([], []).
pack([X|Xs], [Count-X|Ys]) :- 
    pack_(Xs, X, 1, Count, Ys).
pack_([], X, N, N, []).
pack_([X|Xs], X, K, N, Ys) :- 
    !, K1 is K+1, pack_(Xs, X, K1, N, Ys).
pack_([Y|Ys], X, N, N, [N-X|Zs]) :- 
    pack(Ys, Zs).
