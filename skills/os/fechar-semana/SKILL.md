---
name: fechar-semana
description: Fecha uma semana de trabalho a partir das evidências locais do OS, separando entregas, decisões, pendências, riscos e aprendizados. Use em /fechar-semana, "resuma minha semana", retrospectiva semanal ou antes de montar a próxima semana.
---

# Fechar a semana

Produzir um fechamento verificável. Não usar a memória da conversa como fonte principal.

## 1. Definir o período

Usar o intervalo informado. Se não houver, considerar a semana corrente de segunda a domingo e declarar as datas exatas.

## 2. Ler as fontes disponíveis

Ler, quando existirem:

1. `0-eu/prioridades.md`;
2. `memoria.md` e `saidas/RETOMAR.md`;
3. fichas em `projetos/` alteradas no período;
4. `conhecimento/log.md` e `decisoes/log.md`;
5. `saidas/diario/` e `saidas/rotinas/` do período;
6. agenda, reuniões e comunicações importadas localmente.

Registrar no fechamento quais fontes foram usadas e quais estavam ausentes. Nunca fingir uma conexão.

## 3. Separar atividade de resultado

Classificar cada achado como:

- **entrega:** artefato ou mudança observável;
- **decisão:** escolha com consequência;
- **pendência:** próximo movimento ainda aberto;
- **risco:** condição que pode comprometer resultado ou prazo;
- **aprendizado:** padrão útil sustentado por evidência.

Não transformar quantidade de reuniões, mensagens ou horas em avanço sem resultado associado.

## 4. Criar o fechamento

Ativar `rotinas/fechamento-semanal.md` a partir de `rotinas/modelos/fechamento-semanal.md` se o contrato ainda não existir. Manter `estado: DRAFT`.

Salvar a saída em:

`saidas/rotinas/fechamento-semanal/AAAA-Sww.md`

Usar esta estrutura:

```markdown
# Fechamento da semana AAAA-Sww

> Período: AAAA-MM-DD a AAAA-MM-DD
> Estado: RASCUNHO

## Síntese executiva
## Entregas comprovadas
## Decisões e efeitos
## Pendências e bola com quem
## Riscos e bloqueios
## Aprendizados
## Proposta de até três focos
## Fontes usadas
## Fontes ausentes ou incompletas
```

Citar caminhos relativos junto aos fatos relevantes.

## 5. Fazer write-back mínimo

- Registrar a execução no contrato da rotina.
- Acrescentar uma linha em `conhecimento/log.md`.
- Atualizar `saidas/RETOMAR.md` somente com pendências e próximo passo confirmados pela evidência.
- Não alterar prioridades automaticamente. Apresentar a proposta e pedir confirmação.

## Critério de pronto

Outra sessão consegue entender o que realmente mudou na semana e iniciar o planejamento seguinte sem reler todas as conversas.

