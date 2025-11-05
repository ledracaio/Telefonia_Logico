:- dynamic obs/2.

pergunta_num(Label, Campo) :-
  format("~w ", [Label]),
  read(Val),
  assertz(obs(Campo, Val)).

pergunta_bool(Label, Campo) :-
  format("~w (s/n): ", [Label]),
  read(Resp0),
  downcase_atom(Resp0, Resp),
  (Resp == s -> assertz(obs(Campo, sim))
  ; Resp == n -> assertz(obs(Campo, nao))
  ; format("Entrada inválida.~n"), pergunta_bool(Label, Campo)).

coletar_observacoes :-
  format("~n-- Coleta de informações do usuário --~n"),
  pergunta_num("Minutos usados:", minutos),
  pergunta_num("GB usados:", dados_gb),
  pergunta_num("SMS enviados:", sms),
  pergunta_num("Minutos em roaming:", minutos_roaming),
  pergunta_num("GB em roaming:", dados_roaming_gb),
  pergunta_num("Orçamento máximo (R$):", orcamento_max),
  pergunta_bool("Prefere controle de gastos?", preferencia_controle),
  pergunta_bool("Prefere mais dados do que voz?", preferencia_dados),
  format("~nInformações registradas.~n").

cleanup :- retractall(obs(_, _)).
