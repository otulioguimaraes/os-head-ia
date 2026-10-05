---
name: criar-rotina
description: Converte uma atividade recorrente em rotina documentada, manual e testável antes de automatizar. Use em /criar-rotina, ao construir briefing, resumo semanal, planejamento da semana ou qualquer fluxo repetitivo do OS.
---

# Criar uma rotina

Documente o trabalho antes de automatizá-lo.

## 1. Mapear o trabalho real

Pergunte:

- qual resultado deve existir;
- quando a rotina começa;
- quais fontes humanas ou sistemas usa hoje;
- quais decisões exigem julgamento;
- qual saída é útil e para quem;
- o que nunca pode acontecer sem aprovação.

Se a descrição ainda for uma atividade isolada, explique a lacuna. Uma rotina precisa de gatilho, entrada, transformação, saída e critério de qualidade.

## 2. Criar o contrato

Copie a estrutura de `rotinas/modelos/contrato.md` para `rotinas/<slug>.md`. Defina:

- `estado: DRAFT`;
- gatilho e frequência;
- fontes permitidas;
- passos numerados;
- saída e destino;
- limites e aprovações;
- critério de pronto;
- registro de execuções.

Não inclua credenciais. Para fonte ainda não conectada, registre o fallback manual.

## 3. Executar manualmente

Peça um conjunto pequeno de dados reais ou use `dados-demo/` com marcação explícita. Se a rotina processa arquivos que chegam com o tempo (ex.: faturas), defina uma pasta fixa de entrada, como `entrada/faturas/`, fora do `_inbox/` (o `_inbox/` é a fila de ingestão e se esvazia), e inclua o passo: *"se não houver arquivo novo desde a última execução, registre `sem arquivo novo` e pare"*. Execute a rotina uma vez sem agendamento.

Registre no contrato:

- data;
- resultado;
- fontes realmente usadas;
- lacunas;
- ajuste necessário.

Salve a saída em `saidas/rotinas/<slug>/AAAA-MM-DD.md`.

## 4. Avaliar maturidade

Mantenha `DRAFT` até haver **pelo menos uma execução manual aprovada pelo usuário**. Só proponha agendamento (seção 5) se:

- entradas são estáveis;
- falhas são visíveis;
- o resultado foi aprovado;
- ações externas têm confirmação;
- existe forma de pausar e retomar.

Não crie agendamento por conta própria: o agendamento é feito pelo usuário, com a sua orientação (seção 5). Se o usuário não pediu para agendar, termine com o próximo teste manual recomendado.

## 5. Escolher o nível de autonomia (quando o usuário pedir para agendar)

Leia `guias/rotinas/niveis-de-autonomia.md` e mostre os quatro níveis em uma tabela curta. Recomende o **menor nível que resolve**:

1. **Você chama** — o usuário roda o comando quando quer.
2. **Agendada no seu computador** — roda no horário com o computador ligado e o app aberto. Lê a pasta do OS.
3. **Agendada na nuvem** — roda com o computador desligado, mas **não lê a pasta local**; precisa de repositório ou de fontes na nuvem.
4. **Servidor sempre ligado** — VPS. Assunto de agente, não de rotina simples.

Só ofereça o nível 2 ou acima depois de **pelo menos uma execução manual aprovada** e se a rotina:

- só lê e escreve dentro do OS (rascunho, resumo, relatório);
- não envia, não publica, não paga e não apaga nada sem aprovação;
- tem saída num lugar fixo (`saidas/rotinas/<slug>/`).

Para o nível 2, guie o usuário pelo app que ele usa (os nomes estão no guia). O usuário cria o agendamento com as próprias mãos; você escreve o texto das instruções da tarefa agendada, que deve ser: *"Na pasta deste OS, execute a rotina descrita em `rotinas/<slug>.md` e salve a saída em `saidas/rotinas/<slug>/`. Não execute nenhuma ação externa."*

Para provar o agendamento sem esperar o mês inteiro, crie primeiro um **disparo de teste** para daqui a poucos minutos, confira a saída e só então ajuste para a frequência real. Depois do primeiro disparo agendado, confira a saída com o usuário e registre no contrato: `estado: AGENDADA (nível N, <app>, <frequência>)`. Se algo falhar, volte para `DRAFT`.

