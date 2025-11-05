# 🧠 Sistema Especialista — Recomendador de Planos de Telefonia  
[![Desenvolvido por Caio Augusto Ledra](https://img.shields.io/badge/Desenvolvido%20por-Caio%20Augusto%20Ledra-007ACC?style=flat-square)](https://github.com/CaioAugustoLedra)  
[![Linguagem: Prolog](https://img.shields.io/badge/Linguagem-Prolog-B22222?style=flat-square&logo=prolog)](https://www.swi-prolog.org/)  
[![Paradigma: Lógico](https://img.shields.io/badge/Paradigma-Programação%20Lógica-800080?style=flat-square)](https://en.wikipedia.org/wiki/Logic_programming)  

---

## ✨ Descrição do Projeto

**Sistema Especialista — Recomendador de Planos de Telefonia** é uma aplicação desenvolvida em **SWI-Prolog** capaz de recomendar o **plano de telefonia mais adequado** de acordo com o perfil de uso do usuário.  

O sistema realiza perguntas sobre o consumo mensal de:
- Minutos de voz;
- Dados móveis (GB);
- Quantidade de SMS enviados;
- Uso em roaming;
- Orçamento máximo;
- Preferências entre voz e dados.

Com base nas respostas, o sistema utiliza **regras lógicas (inferência)** para identificar o plano mais compatível e exibe uma **explicação textual** sobre quais regras foram disparadas para chegar à conclusão.

---

## 📂 Estrutura do Projeto

| Arquivo | Descrição |
| :--- | :--- |
| `main.pl` | Controla o fluxo principal, menu inicial e execução do sistema. |
| `kb.pl` | Base de conhecimento com os planos, preços e limites de uso. |
| `rules.pl` | Regras de inferência que conectam sintomas (respostas) aos planos recomendados. |
| `ui.pl` | Interface textual — responsável por coletar respostas do usuário. |
| `explain.pl` | Gera a explicação das regras disparadas após a inferência. |

---

## ⚙️ Instalação e Execução

### 🧩 Pré-requisitos
- [SWI-Prolog (versão 9.x ou superior)](https://www.swi-prolog.org/download/stable)

### 🚀 1. Clonar o Repositório
```bash
git clone https://github.com/ledracaio/Telefonia_Logico.git
```

### 🧠 2. Executar o Sistema no SWI-Prolog
```bash
swipl
?- set_prolog_flag(encoding, utf8).
?- [main].
?- start.
```

---

## 💬 Exemplo de Execução

### 🧾 Entrada do Usuário
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

### 📤 Saída Esperada
```bash
"[Explicação do resultado]"
- Regra disparada: preferencia_dados_alto
- Regra disparada: uso_alto_geral

=> Plano recomendado: plus

RECOMENDAÇÃO FINAL: plus
```

---

## 🎯 Funcionalidades Chave

| Funcionalidade | Descrição |
| :--- | :--- |
| **Inferência Automática** | O sistema aplica regras lógicas para deduzir o plano mais adequado. |
| **Explicação Detalhada** | Exibe quais regras foram ativadas durante a recomendação. |
| **Base de Conhecimento Modular** | Fatos e planos definidos em arquivo separado (`kb.pl`). |
| **Interface Textual** | Perguntas e coleta de informações via terminal. |
| **Execução Interativa** | Permite repetir o processo e registrar novas observações. |

---

## 🧩 Cenário de Teste (Evidência E2E)

O cenário abaixo demonstra um usuário com:
- **800 minutos** de voz;
- **25 GB** de dados móveis;
- **Orçamento máximo de R$ 80**;
- ***Demais campos preencher com 0.**
- Preferência por **dados**.

Neste caso, o sistema dispara as regras `preferencia_dados_alto` e `uso_alto_geral`, resultando na recomendação do plano **“plus”**.

---

## 🔢 Passo a Passo (Execução Completa)

1️⃣ Iniciar o sistema com `start.`  
2️⃣ O menu principal é exibido.  
3️⃣ O usuário escolhe **1) Executar recomendação**.  
4️⃣ O sistema realiza perguntas sobre uso e preferências.  
5️⃣ As observações são armazenadas como fatos (`obs/2`).  
6️⃣ As regras correspondentes são ativadas.  
7️⃣ O plano recomendado é inferido automaticamente.  
8️⃣ As regras disparadas são listadas no terminal.  
9️⃣ O sistema exibe a recomendação final e retorna ao menu.  

---

## 🧰 Ferramentas Utilizadas

- **SWI-Prolog 9.x**  
- **VS Code** (com extensão *SWI-Prolog*)  
- **Git / GitHub**  
- **Windows 11 (UTF-8 habilitado)**  

---

## 👨‍💻 Desenvolvido por

**Caio Augusto Ledra**  
📧 *caio.ledra@unidavi.edu.br*  
📚 *UNIDAVI — Sistemas de Informação*  

---
