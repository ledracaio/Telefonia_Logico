:- ["kb.pl", "rules.pl", "ui.pl", "explain.pl"].

start :-
  banner, menu.

banner :-
  format("~n=== Sistema Especialista - Recomendador de Planos de Telefonia ===~n"),
  format("Desenvolvido por: @ledracaio~n~n").

menu :-
  format("1) Executar recomendação~n2) Sair~n> "),
  read(Opt),
  ( Opt = 1 -> run_case, cleanup, menu
  ; Opt = 2 -> format("Saindo...~n")
  ; format("Opção inválida.~n"), menu ).

run_case :-
    coletar_observacoes,
    ( meta(Result, Plano) ->
        explicar(Result, Plano),
        format("~nRECOMENDAÇÃO FINAL: ~w~n", [Plano])
    ; format("~nNão foi possível gerar uma recomendação.~n")
    ),
    true.
