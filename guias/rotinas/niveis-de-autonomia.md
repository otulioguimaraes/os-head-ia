# Níveis de autonomia de uma rotina

> Nomes conforme a documentação oficial lida em 2026-10-05 (links em cada item). Os apps mudam nomes de menu com frequência: se não achar, procure pelo nome do recurso na ajuda do app ou peça ao seu OS para pesquisar.

Uma rotina é uma skill que ganhou hora marcada. Antes de agendar, ela precisa ter rodado bem **à mão** (skill `/criar-rotina`). Depois, suba **só até o nível que resolve**.

| Nível | Como roda | Lê a pasta do OS? | O que precisa | Onde fica |
|---|---|---|---|---|
| **1 · Você chama** | você pede quando quer | sim | nada | qualquer app, ex.: "rode a rotina de fatura" |
| **2 · Agendada no seu computador** | no horário, com o computador ligado e o app aberto | **sim** | o app do Claude ou do ChatGPT | Claude Desktop: aba **Code** → **Routines** → **New routine** → **Local**. ChatGPT desktop app (o antigo Codex): **Scheduled tasks** |
| **3 · Agendada na nuvem** | com o computador desligado | **não** — só repositório GitHub ou fontes na nuvem | conta e, às vezes, um pouco de código | Claude: **Routines** → **Cloud**. ChatGPT web: **Scheduled tasks**. Para quem programa: GitHub Actions, Trigger.dev, Modal |
| **4 · Servidor sempre ligado** | 24 horas, num computador alugado | depende | uma VPS | agentes (próximo encontro) |

## O que saber de cada um

**Nível 2 — Claude Desktop, Routines → Local** ([doc](https://code.claude.com/docs/en/desktop-scheduled-tasks.md))
- Escolhe a pasta de trabalho (a pasta do OS), o modelo, a permissão e o horário.
- **Permissão:** a tarefa roda sem ninguém na frente. Se o modo exigir aprovação a cada passo, ela fica parada esperando. Escolha o modo que deixa editar arquivos **só dentro da pasta do OS**, e confie nos limites do contrato da rotina (não enviar, não pagar, não apagar). Nunca use um modo que libere tudo para uma rotina que ainda não rodou bem à mão.
- Só roda com o app **aberto** e o computador **acordado**. Se perder um horário, faz uma execução de recuperação quando você volta (até 7 dias).
- Intervalo mínimo: 1 minuto.

**Nível 2 — ChatGPT desktop app, Scheduled tasks** ([doc](https://learn.chatgpt.com/docs/automations.md?surface=app))
- Roda na pasta do projeto. Precisa do computador ligado e do app aberto.
- Os resultados ficam no menu **Scheduled** da barra lateral.
- Teste o pedido num chat normal antes de agendar (recomendação da própria doc).
- No plano Free do ChatGPT há limite de tarefas e horário flexível; horário exato exige plano pago ([ajuda](https://help.openai.com/en/articles/10291617-scheduled-tasks-in-chatgpt)).

**Nível 3 — Claude, Routines → Cloud** ([doc](https://code.claude.com/docs/en/routines.md))
- Roda na nuvem da Anthropic, com o computador desligado.
- **Não enxerga sua pasta local.** Trabalha num repositório do GitHub e nos conectores (Slack, Drive etc.).
- Intervalo mínimo: 1 hora. Planos Pro, Max, Team e Enterprise.

**Nível 3 — ferramentas para quem programa**
- GitHub Actions (`schedule`): grátis em repositório público; privado tem 2.000 min/mês no plano Free. Horário em UTC (8h de Brasília = 11h UTC). ([doc](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows))
- Trigger.dev (`schedules.task`): plano grátis com US$ 5/mês de crédito. ([doc](https://trigger.dev/docs/tasks/scheduled))
- Modal (`modal.Cron`): função em Python, plano grátis com US$ 30/mês de crédito. ([doc](https://modal.com/docs/guide/cron))

**Fora da lista, de propósito:** "a API do GPT" ou "a API do Claude". A API é o cérebro que a rotina chama, e não um jeito de agendar.

## A regra de subida

1. Rodou bem à mão pelo menos uma vez → pode ir para o nível 2.
2. Rodou bem no nível 2 por uma semana e precisa rodar com o computador desligado → avalie o nível 3.
3. Precisa decidir sozinha e agir em canais (WhatsApp, Slack) → é agente, nível 4.

**Em qualquer nível:** a rotina lê e rascunha. Ela não envia, não publica, não paga e não apaga nada sem o seu OK.
