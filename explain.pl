:- dynamic regra_ativa/1.

explicar(Regras, Plano) :-
  format("~n[Explicação do resultado]~n"),
  (Regras == [] ->
      format("- Nenhuma regra específica disparou; aplicado plano padrão.~n")
  ;
      forall(member(R, Regras),
             format("- Regra disparada: ~w~n", [R]))
  ),
  format("~n=> Plano recomendado: ~w~n", [Plano]).
