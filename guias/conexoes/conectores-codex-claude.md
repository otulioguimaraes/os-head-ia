# Conectores no Codex e no Claude

Objetivo: dar ao agente acesso controlado a uma fonte externa sem pedir que o aluno programe uma integração.

Documentação oficial verificada em `2026-09-01`:

- Codex MCP: <https://developers.openai.com/codex/mcp/>
- Claude — primeiros passos com conectores: <https://claude.com/docs/connectors/getting-started>
- Claude Desktop — servidores locais: <https://support.claude.com/en/articles/10949351-getting-started-with-local-mcp-servers-on-claude-desktop>

## Antes de conectar

Confirme cinco pontos:

1. qual fonte o OS precisa consultar;
2. qual conta será autorizada;
3. se o acesso inclui leitura, escrita ou ambos;
4. qual registro pequeno será usado no teste;
5. onde a conexão pode ser revogada.

Não cole senha, token ou chave no chat. Quando houver OAuth, autentique na página oficial aberta pelo aplicativo.

## Codex Desktop

Use esta rota quando a fonte informar uma URL MCP oficial:

1. Abra **Settings**.
2. Entre em **MCP servers**.
3. Clique em **Add server**.
4. Dê um nome à conexão.
5. Escolha **Streamable HTTP** e cole somente a URL publicada pela fonte oficial.
6. Salve e reinicie o aplicativo.
7. Se aparecer **Authenticate**, conclua o OAuth no navegador.
8. Digite `/mcp` para conferir a conexão.

O Codex Desktop, a CLI e a extensão compartilham a configuração do mesmo host. Uma configuração de usuário pode afetar outros projetos; quando a conexão for exclusiva deste OS, prefira escopo de projeto.

## Codex CLI

Para um servidor HTTP oficial:

```bash
codex mcp add NOME --url URL_OFICIAL
codex mcp login NOME
codex mcp list
```

Dentro do Codex, use `/mcp` para conferir o estado. A configuração global fica em `~/.codex/config.toml`; conexões específicas de um projeto podem ficar em `.codex/config.toml` quando o projeto é confiável.

Quando uma conexão oferecer ferramentas de escrita, configure aprovação para escrita ou desabilite essas ferramentas. Não transforme a primeira leitura em autorização permanente para alterar a fonte.

## Claude Desktop e Claude na web

Para conectores disponíveis no diretório:

1. Abra **Settings** ou **Customize**.
2. Entre em **Connectors**.
3. Localize a fonte.
4. Clique em **Connect**.
5. Revise as permissões e autentique a conta correta.
6. Em uma conversa, habilite a fonte no botão `+` quando necessário.

Para um MCP remoto oficial que não esteja no diretório, use **Add Connector** e informe a URL oficial. Algumas contas corporativas exigem liberação do administrador.

## Claude Code

Quando a documentação da fonte publicar uma URL MCP, use o formato recomendado pela própria fonte. Exemplo genérico:

```bash
claude mcp add NOME --transport http URL_OFICIAL
```

Depois, abra uma nova sessão e use `/mcp` para autenticar e conferir. Não invente uma URL a partir do nome do serviço.

## Teste mínimo

Peça uma consulta que não escreva nada:

```text
Confirme qual conta e fonte estão conectadas. Depois liste somente três itens recentes, com título, data e link ou identificador. Não altere nem envie nada.
```

Confira se os itens pertencem ao escopo autorizado. Só depois selecione um item e execute `/ingerir`.

## Desconectar

- Codex Desktop: **Settings → MCP servers → conexão → Disable/Remove**.
- Codex CLI: confira `codex mcp --help` e remova ou desabilite o servidor configurado.
- Claude: **Settings/Customize → Connectors → fonte → Disconnect**.
- Serviço de origem: revogue também em **Apps conectados**, **Integrações** ou **Segurança** quando quiser encerrar totalmente o acesso.

## Critério de aceite

- servidor e domínio conferidos na documentação oficial;
- autenticação feita fora do chat;
- conta e escopo confirmados;
- três itens foram lidos sem escrita;
- uma unidade autorizada foi ingerida com origem;
- caminho de revogação foi localizado;
- estado real foi registrado em `conexoes.md`.
