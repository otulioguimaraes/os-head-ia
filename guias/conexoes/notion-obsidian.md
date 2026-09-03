# Notion e Obsidian — bases de conhecimento

Objetivo: aproveitar conhecimento já organizado sem perder a origem nem conceder escrita ampla antes de validar a leitura.

Documentação oficial verificada em `2026-09-01`:

- Notion MCP: <https://developers.notion.com/guides/mcp/overview>
- conectar o Notion MCP: <https://developers.notion.com/guides/mcp/get-started-with-mcp>
- segurança do Notion MCP: <https://developers.notion.com/guides/mcp/mcp-security-best-practices>
- exportar conteúdo do Notion: <https://www.notion.com/help/export-your-content>
- vaults do Obsidian: <https://obsidian.md/help/manage-vaults>

## Notion — rota recomendada: MCP oficial

URL oficial: `https://mcp.notion.com/mcp`

No Codex:

```bash
codex mcp add notion --url https://mcp.notion.com/mcp
codex mcp login notion
```

No Claude Code:

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```

No Claude Desktop, abra **Settings → Connectors → Add Connector**, informe a URL e conclua o OAuth.

O MCP oficial pode ler e escrever conforme as permissões da conta. Na primeira ativação:

1. confirme o workspace;
2. não crie nem altere páginas;
3. pesquise um título conhecido;
4. liste até três resultados;
5. abra uma página autorizada;
6. execute `/ingerir` somente para o conteúdo selecionado.

## Notion — fallback por exportação

Para uma página, use `••• → Export` e escolha Markdown/CSV, HTML ou PDF. Para o workspace, use **Settings → General → Export all workspace content** quando seu papel permitir. Páginas privadas sem acesso e conteúdos restringidos pelo teamspace não entram na exportação.

No Windows, caminhos longos podem dificultar a extração do ZIP. A própria documentação recomenda desmarcar a criação de pastas para subpáginas ou usar uma ferramenta que lide melhor com caminhos longos.

Não descompacte um workspace inteiro dentro do OS. Selecione a área necessária e preserve o ZIP em local controlado.

## Obsidian — rota recomendada: pasta local

Um vault do Obsidian é uma pasta no computador que contém notas, anexos e a configuração `.obsidian`. Como as notas já são arquivos locais, a primeira integração não precisa de API.

Opção segura:

1. No Obsidian, use **Manage Vaults** para confirmar o caminho do vault.
2. Escolha uma subpasta pequena e autorizada.
3. Informe o caminho exato ao agente e autorize apenas a leitura dessa subpasta.
4. Peça uma listagem de até dez arquivos Markdown.
5. Escolha um arquivo e execute `/ingerir` preservando o caminho de origem.

Não copie a pasta `.obsidian`, plugins, cache ou todo o vault para o OS. Não autorize escrita no vault na primeira conexão.

## Compatibilidade

- Notion MCP: depende do cliente MCP e da autenticação no navegador, não do sistema operacional em si.
- Exportação Notion: desktop ou web; o workspace completo não é exportado pelo celular.
- Obsidian: macOS, Windows e Linux funcionam pelo mesmo princípio de pasta local; o caminho muda em cada computador.

## Desconectar

- Notion: remova/desabilite o servidor no cliente e revogue a conexão no Notion.
- Obsidian: remova a autorização de leitura do caminho e apague qualquer cópia temporária que não precise ser preservada.

## Critério de aceite

- workspace ou vault correto confirmado;
- escopo restrito a uma página, banco ou subpasta;
- uma leitura real foi comprovada sem escrita;
- anexos e links ausentes foram registrados como lacuna;
- original e caminho de origem foram preservados;
- forma de revogar foi testada ou documentada.
