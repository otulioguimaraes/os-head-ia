# Rotinas

Uma rotina é um contrato repetível: gatilho, fontes, passos, saída, limites e critério de qualidade.

Toda rotina começa em `DRAFT`, roda manualmente e registra sua execução. Só depois de validada pode ser candidata a automação.

Use `/criar-rotina` para criar uma nova rotina a partir de `modelos/contrato.md`.

## Rotinas incluídas

- `/briefing-manha`: atenção e primeira ação do dia;
- `/fechar-semana`: resultados, decisões, pendências e aprendizados;
- `/montar-semana`: até três resultados compatíveis com agenda e capacidade.

Os contratos-base permanecem em `modelos/`. Na primeira execução, a skill cria uma cópia na raiz de `rotinas/`, mantém `DRAFT` e registra o teste manual. Nenhuma delas agenda ou envia algo automaticamente.
