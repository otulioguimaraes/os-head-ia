# Catálogo de conexões do OS

Este catálogo ajuda uma pessoa não técnica a escolher o menor caminho que entrega contexto útil ao OS. As instruções foram verificadas na documentação oficial em `2026-09-01`.

## Regra de escolha

Use esta ordem:

1. conector nativo ou MCP oficial com autenticação no navegador;
2. exportação oficial feita pelo próprio usuário;
3. ferramenta local documentada;
4. integração personalizada somente quando as opções anteriores não cumprem o objetivo.

Comece em leitura, com uma fonte e uma unidade de teste. Escrita externa, instalação e automação exigem explicação e aprovação prévia.

## O que já tem playbook

| Fonte | Primeira rota recomendada | Automação disponível | Guia |
|---|---|---|---|
| Codex e Claude | conector nativo ou MCP oficial | sim | [conectores-codex-claude.md](conectores-codex-claude.md) |
| Reuniões | uma reunião exportada | Fireflies, Granola e tl;dv possuem MCP oficial; Fathom possui API | [reunioes.md](reunioes.md) |
| Fathom | exportação manual | API oficial | [fathom.md](fathom.md) |
| Slack | conector nativo do Claude ou exportação oficial | depende do plano e do administrador | [slack.md](slack.md) |
| Google | amostra de Gmail, Calendar ou Drive | `gog` com OAuth | [google.md](google.md) |
| Notion | MCP oficial do Notion | sim | [notion-obsidian.md](notion-obsidian.md) |
| Obsidian | abrir/copiar uma pasta do vault | automação local opcional | [notion-obsidian.md](notion-obsidian.md) |
| WhatsApp | exportar uma conversa | `wacli` para arquivo local recorrente | [whatsapp-wacli.md](whatsapp-wacli.md) |
| Telegram | exportação pelo Telegram Desktop | bot apenas para conversas futuras autorizadas | [telegram-discord.md](telegram-discord.md) |
| Discord | pacote de dados oficial | bot exige app, permissões e escopos | [telegram-discord.md](telegram-discord.md) |
| GitHub | registrar URL ou clone externo | Git/GitHub CLI | [github.md](github.md) |
| Qualquer outra | arquivo ou texto | avaliar depois | [importacao-manual.md](importacao-manual.md) |

Para uma fonte que ainda não aparece na tabela, execute:

```text
/search-connectors <nome do aplicativo>
```

A pesquisa compara opções atuais e oficiais antes de alternativas comunitárias. Instalação e autenticação continuam separadas e exigem aprovação.

## Teste padrão de qualquer conexão

1. Confirme a conta e o escopo que serão acessados.
2. Autorize apenas o necessário e prefira leitura.
3. Consulte ou exporte uma única unidade.
4. Confira origem, período, participantes e conteúdo.
5. Preserve o bruto e execute `/ingerir`.
6. Registre o resultado em `conexoes.md` e `conexoes/<slug>.md`.
7. Teste como desconectar ou revogar.

Uma conexão não está pronta apenas porque a tela mostra “conectado”. Ela está pronta quando uma leitura real, pequena e autorizada foi comprovada.
