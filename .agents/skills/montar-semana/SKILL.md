---
name: montar-semana
description: Monta um plano semanal realista a partir de prioridades, fechamento anterior, agenda, projetos e capacidade disponível. Use em /montar-semana, "planeje minha semana", planejamento semanal ou depois de /fechar-semana.
---

# Montar a semana

Transformar contexto em escolhas executáveis. Agenda é restrição de capacidade, não decoração.

## 1. Definir a semana

Usar o período informado. Se não houver, usar a próxima semana de segunda a domingo e declarar as datas exatas.

## 2. Ler as fontes disponíveis

Ler, quando existirem:

1. `0-eu/prioridades.md`;
2. o fechamento semanal mais recente;
3. `memoria.md` e `saidas/RETOMAR.md`;
4. projetos ativos e seus próximos passos;
5. agenda importada para o período;
6. prazos, dependências e pendências registradas.

Se não houver agenda, produzir plano **provisório sem validação de capacidade**. Declarar a lacuna e não inventar horários livres.

## 3. Calcular a capacidade útil

- Identificar compromissos fixos primeiro.
- Preservar margem para operação e imprevistos; não ocupar 100% do tempo conhecido.
- Limitar o plano a no máximo três resultados principais.
- Relacionar cada resultado a uma prioridade, projeto, evidência de conclusão e primeira ação.
- Tornar explícito o que não caberá na semana.

Não confundir lista de tarefas com plano. Um resultado precisa descrever uma mudança observável.

## 4. Criar o plano

Ativar `rotinas/montar-semana.md` a partir de `rotinas/modelos/montar-semana.md` se o contrato ainda não existir. Manter `estado: DRAFT`.

Salvar a saída em:

`saidas/rotinas/montar-semana/AAAA-Sww.md`

Usar esta estrutura:

```markdown
# Plano da semana AAAA-Sww

> Período: AAAA-MM-DD a AAAA-MM-DD
> Estado: PROPOSTA
> Capacidade: validada | provisória

## Três resultados da semana
## Compromissos fixos
## Blocos de foco sugeridos
## Acompanhamentos
## Riscos, dependências e margens
## Não fazer nesta semana
## Primeira ação de cada resultado
## Fontes usadas
## Fontes ausentes ou incompletas
```

## 5. Pedir confirmação

Apresentar o plano antes de alterar prioridades, agenda ou sistemas externos.

Depois da aprovação:

- registrar a execução no contrato da rotina;
- acrescentar uma linha em `conhecimento/log.md`;
- atualizar `memoria.md` e `saidas/RETOMAR.md` com os resultados confirmados;
- não criar, mover ou cancelar eventos sem autorização separada.

## Critério de pronto

O plano cabe na capacidade conhecida, explicita renúncias e dá a cada resultado uma primeira ação concreta.

