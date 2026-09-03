---
name: sessao
description: Abre, retoma ou encerra uma sessão preservando contexto, decisões, pendências e o próximo passo exato. Use em /sessao, ao começar o dia, antes de fechar o agente ou quando o usuário disser para salvar o ponto de retomada.
---

# Gerenciar sessão

Evite que o trabalho dependa da memória da conversa.

## Regra de ouro

Ao final de toda sessão de trabalho útil, execute `/sessao` antes de fechar o agente. A conversa por si só não é memória operacional.

## Escolher o modo

- Se o usuário está chegando ou pergunta onde parou, use **retomar**.
- Se o usuário vai sair, concluiu uma etapa ou pede para salvar, use **encerrar**.
- Se houver dúvida, mostre o estado e pergunte qual modo deseja.

## Retomar

Leia:

1. `saidas/RETOMAR.md`;
2. `memoria.md`;
3. `0-eu/prioridades.md`;
4. o projeto ativo;
5. registros recentes de `conhecimento/log.md` e `decisoes/log.md`.

Responda com:

- objetivo atual;
- o que já está pronto;
- pendências;
- bloqueios reais;
- uma próxima ação de até 30 minutos.

Não altere arquivos no modo retomar, salvo se o usuário pedir correção.

## Encerrar

Leia a conversa disponível desde o início da sessão e inspecione os arquivos alterados. Reconstrua o que ocorreu a partir das duas evidências; não dependa apenas da lembrança ou de um resumo automático.

Extraia e diferencie:

- fatos e contexto novos;
- decisões realmente tomadas e a razão;
- artefatos criados ou alterados;
- mudanças de estado do projeto;
- pendências, bloqueios e dúvidas;
- próximo passo concreto;
- método que começou a se repetir e pode merecer uma skill.

Atualize `memoria.md` com:

- data;
- foco atual;
- artefatos concluídos;
- decisões tomadas;
- pendências;
- bloqueios;
- próxima ação.

Atualize `saidas/RETOMAR.md` com uma versão curta e operacional:

```markdown
# Retomar daqui

Atualizado em: AAAA-MM-DD

## Contexto em uma frase
## O que ficou pronto
## Próxima ação
## Depois disso
## Bloqueios conhecidos
```

Registre trabalho relevante em `conhecimento/log.md`. Registre decisões apenas em `decisoes/log.md`; não invente uma decisão para preencher o log.

Antes de escrever no log de decisões, confirme se a decisão pertence ao usuário nesta sessão ou veio de uma fonte real autorizada. Decisões e compromissos de projetos ou fontes `DEMO` permanecem apenas nos artefatos demonstrativos e nunca entram no estado real do usuário.

Se o projeto ativo mudou, atualize sua ficha. Se houver um padrão repetível, sugira a criação de uma skill, mas não a crie automaticamente e não transforme toda conversa em procedimento.

## Validar

O próximo agente deve conseguir continuar sem ler a conversa anterior. Verifique se `saidas/RETOMAR.md` contém estado, evidência, próximo passo e bloqueios suficientes. Se não conseguir, a sessão ainda não está fechada.
