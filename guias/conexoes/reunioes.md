# Reuniões — Fireflies, Granola, tl;dv e Plaud

Objetivo: fazer o OS consultar ou receber transcrições preservando origem, participantes, data e limitações.

Documentação oficial verificada em `2026-09-01`:

- Fireflies MCP: <https://docs.fireflies.ai/getting-started/mcp-configuration>
- Fireflies — exportar reuniões: <https://guide.fireflies.ai/articles/3319752033-how-to-download-transcripts-summaries-and-meeting-recordings-from-fireflies>
- Granola MCP: <https://docs.granola.ai/help-center/sharing/integrations/mcp>
- Granola — exportar notas: <https://docs.granola.ai/help-center/sharing/exporting-notes>
- tl;dv MCP: <https://intercom.help/tldv/en/articles/15322415-mcp>
- tl;dv — copiar transcrição: <https://intercom.help/tldv/en/articles/6122489-how-to-download-transcripts>
- Plaud — exportar dados: <https://support.plaud.ai/hc/en-us/articles/51573949068697-How-to-export-my-data>

Use [fathom.md](fathom.md) quando a fonte for Fathom.

## Rota comum para a primeira vitória

1. Escolha uma reunião sem conteúdo pessoal ou estratégico desnecessário.
2. Exporte ou copie a transcrição com timestamps e falantes, quando disponíveis.
3. Salve em `_inbox/` sem editar o original.
4. Execute `/ingerir`.
5. Confira se a nota derivada aponta para a fonte bruta.

Esse caminho funciona em qualquer sistema operacional e continua sendo o fallback das conexões automáticas.

## Fireflies

### Conexão oficial por MCP

URL oficial: `https://api.fireflies.ai/mcp`

No Codex:

```bash
codex mcp add fireflies --url https://api.fireflies.ai/mcp
codex mcp login fireflies
```

No Claude, use **Settings → Connectors → Add Connector**, informe a URL oficial e conclua o OAuth. Prefira OAuth; não cole API key em arquivo Markdown ou chat.

O servidor inclui ferramentas de leitura e de escrita. No primeiro teste, use somente busca, listagem, transcrição e resumo. Não compartilhe, revogue, renomeie ou mova reuniões.

### Exportação

Abra a reunião, clique em **Download** e exporte a transcrição. A documentação informa formatos como MD, JSON, CSV, SRT, DOCX e PDF, com opções de timestamps e falantes; downloads dependem do plano.

Teste: listar três reuniões recentes e abrir uma transcrição específica sem alterar a conta.

## Granola

### Conexão oficial por MCP

URL oficial: `https://mcp.granola.ai/mcp`

No Codex:

```bash
codex mcp add granola --url https://mcp.granola.ai/mcp
codex mcp login granola
```

No Claude Code:

```bash
claude mcp add granola --transport http https://mcp.granola.ai/mcp
```

Depois use `/mcp` e autentique no navegador. A disponibilidade de transcrições, notas compartilhadas e período consultável depende do plano e do espaço. O MCP acessa apenas o conteúdo que a conta autenticada pode consultar segundo as regras oficiais.

### Exportação

- **Settings → Profile → Generate CSV** exporta notas históricas elegíveis, não todas as transcrições.
- Para uma transcrição, abra a nota, revele o painel de transcrição e use **Copy**.
- Não há exportação em massa de transcrições documentada.

Teste: listar três reuniões próprias e recuperar o resumo de uma; pedir transcrição apenas quando o plano permitir.

## tl;dv

### Conector oficial

No workspace do tl;dv, abra **Integrations → Marketplace**. No cliente de IA, procure `tl;dv`, instale, conecte e autentique. A documentação informa requisitos de plano para MCP e API; o acesso a uma reunião também depende do organizador e do plano dele.

O MCP é adequado para consultar reuniões; não assuma que “consigo abrir no app” significa “a API pode exportar”.

### Exportação

Abra a reunião, entre na aba da transcrição e use o botão de copiar. O tl;dv informa que não oferece download em massa de transcrições e que o download individual depende do plano do proprietário e de quem baixa.

Teste: consultar reuniões próprias dos últimos sete dias e recuperar uma transcrição ou resumo autorizado.

## Plaud

Use exportação oficial. Não há neste playbook uma conexão automática validada para o OS.

No Plaud Web:

1. Abra o arquivo.
2. Clique no ícone de compartilhamento/exportação no canto superior.
3. Escolha transcrição, resumo, áudio ou mapa mental.
4. Para transcrição, prefira TXT ou SRT com timestamps e falantes.
5. Para resumo, Markdown é uma boa opção.

No aplicativo móvel, use **Export as file**. A documentação informa opções como TXT, SRT, DOCX e PDF para transcrição, Markdown para resumo e MP3/WAV para áudio, conforme a plataforma.

Teste: exportar uma gravação presencial curta, preservar o áudio separadamente quando autorizado e ingerir a transcrição.

## Consentimento e segurança

- Grave apenas com consentimento compatível com a lei e a política da organização.
- Comece por reuniões próprias ou explicitamente compartilhadas.
- Não exponha transcrições integrais em demonstrações públicas.
- Tokens, chaves, cookies e URLs assinadas não entram no OS.
- Uma URL temporária de áudio ou vídeo não substitui a fonte preservada.
- Ferramentas de compartilhamento, renomeação e movimentação permanecem bloqueadas até aprovação.

## Critério de aceite

- uma conta e uma fonte confirmadas;
- três reuniões listadas ou uma exportação concluída;
- uma reunião lida sem escrita;
- original preservado com data, participantes e sistema de origem;
- transcrição e resumo distinguidos;
- limitações do plano registradas;
- revogação ou fallback manual conhecidos.
