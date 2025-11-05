# 🧠 Sistema Especialista — Recomendador de Planos de Telefonia

**Aluno:** Caio Augusto Ledra (@CaioAugustoLedra)  
**Disciplina:** Linguagens de Programação e Paradigmas — Trabalho 03  
**Instituição:** UNIDAVI  
**Linguagem:** SWI-Prolog  

---

## 📘 Descrição Geral

Este projeto implementa um **sistema especialista em Prolog** que recomenda o plano de telefonia mais adequado de acordo com o perfil de uso e preferências do usuário.  
O sistema faz perguntas sobre consumo de minutos, dados móveis, SMS, uso em roaming e orçamento máximo, aplicando **regras lógicas** para inferir o plano ideal.  

Além da recomendação final, o sistema explica **quais regras foram disparadas** e **por que aquele plano foi escolhido**, simulando o comportamento de um especialista humano.

---

## ⚙️ Estrutura dos Arquivos

| Arquivo | Descrição |
|----------|------------|
| `main.pl` | Controla o fluxo principal, exibe menu, executa a coleta e mostra resultados. |
| `kb.pl` | Base de conhecimento — contém os planos disponíveis e seus atributos (minutos, dados, preço etc). |
| `rules.pl` | Conjunto de regras lógicas que relacionam observações do usuário com planos recomendados. |
| `ui.pl` | Interface textual com o usuário — perguntas e registro das observações. |
| `explain.pl` | Módulo responsável por exibir as explicações das regras disparadas. |

---

## 💻 Como Executar o Sistema

### 1️⃣ Instalar o SWI-Prolog
Baixe e instale a versão estável em:  
👉 https://www.swi-prolog.org/download/stable

### 2️⃣ Clonar o repositório

```bash
git clone https://github.com/<seu_usuario>/recomendador-telefonia.git
cd recomendador-telefonia
```
-->

### 3️⃣ Abrir no SWI-Prolog

```bash
swipl
?- set_prolog_flag(encoding, utf8).
?- [main].
?- start.
```

---

## 🧩 Exemplo de Execução

### Entrada do Usuário

```bash
-- Coleta de informações do usuário --
Minutos usados: 800.
GB usados: 25.
SMS enviados: 100.
Minutos em roaming: 0.
GB em roaming: 0.
Orçamento máximo (R$): 80.
Prefere controle de gastos? (s/n): n.
Prefere mais dados do que voz? (s/n): s.

Informações registradas.
```

### Saída esperada

```bash
"[Explicação do resultado]"
- Regra disparada: preferencia_dados_alto
- Regra disparada: uso_alto_geral

=> Plano recomendado: plus

RECOMENDAÇÃO FINAL: plus
```

---

## 🧠 Contexto do Cenário Testado (Evidência E2E)

O teste a seguir demonstra um cenário em que o usuário utiliza **800 minutos de voz** e **25 GB de dados** mensais, possui orçamento de até **R$ 80**, e indica preferência por **dados móveis**.  
O objetivo do teste é verificar se o sistema identifica corretamente o **plano “plus”** como o mais adequado, disparando as regras relacionadas a alto consumo de dados e uso geral intenso.

---

## 🔢 Passo a Passo (E2E)

1️⃣ O sistema é iniciado com o comando `start.`  
2️⃣ É exibido o banner com o nome do aluno e o menu principal.  
3️⃣ O usuário seleciona a opção **1) Executar recomendação**.  
4️⃣ O sistema faz perguntas sequenciais sobre minutos, GB, SMS, etc.  
5️⃣ O usuário responde conforme o cenário de teste.  
6️⃣ O sistema registra todas as observações internamente (`obs/2`).  
7️⃣ O motor de inferência ativa as regras `preferencia_dados_alto` e `uso_alto_geral`.  
8️⃣ O sistema determina que o plano “plus” é o mais adequado.  
9️⃣ A explicação é exibida, com as regras disparadas listadas.  
🔟 O sistema retorna ao menu principal.

---

## 📊 Prints de Tela Sequenciais (exemplo para relatório PDF)

1. Tela inicial com menu.  
2. Coleta das respostas.  
3. Registro das observações.  
4. Explicação das regras disparadas.  
5. Recomendação final do plano.

---

## 🧰 Ferramentas Utilizadas

- **SWI-Prolog 9.x**
- **VS Code** com extensão *SWI-Prolog*
- **Git / GitHub**
- **Windows 11 (UTF-8 habilitado)**

---

## 🧾 Desenvolvido por

👤 **Caio Augusto Ledra**  
📧 *caioaugustoledra@unidavi.edu.br*  
📚 *UNIDAVI — Sistemas de Informação*  

---

