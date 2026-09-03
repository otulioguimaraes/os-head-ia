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

Peça um conjunto pequeno de dados reais ou use `dados-demo/` com marcação explícita. Execute a rotina uma vez sem agendamento.

Registre no contrato:

- data;
- resultado;
- fontes realmente usadas;
- lacunas;
- ajuste necessário.

Salve a saída em `saidas/rotinas/<slug>/AAAA-MM-DD.md`.

## 4. Avaliar maturidade

Mantenha `DRAFT` por pelo menos uma semana de uso ou até haver evidência suficiente. Só proponha automação se:

- entradas são estáveis;
- falhas são visíveis;
- o resultado foi aprovado;
- ações externas têm confirmação;
- existe forma de pausar e retomar.

Não crie agendamento automaticamente. Termine com o próximo teste manual recomendado.

