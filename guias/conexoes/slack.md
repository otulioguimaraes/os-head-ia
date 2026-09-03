# Slack — conversas e arquivos de trabalho

Objetivo: consultar contexto profissional autorizado sem transformar o OS em uma cópia irrestrita de mensagens privadas.

Documentação oficial verificada em `2026-09-01`:

- Claude e Slack: <https://claude.com/docs/connectors/slack>
- exportação do workspace: <https://slack.com/help/articles/201658943-Export-your-workspace-data>
- leitura dos arquivos exportados: <https://slack.com/help/articles/220556107-How-to-read-Slack-data-exports>

## Escolha rápida

- Se o Claude e o workspace permitem o conector: use a **Opção A**.
- Se a conexão depende do administrador ou o aluno usa Codex: use a **Opção B**.
- Não crie um bot Slack na primeira ativação do OS.

## Opção A — conector nativo do Claude

O conector pode pesquisar canais, mensagens diretas e arquivos dentro das permissões da conta conectada. A disponibilidade depende do plano e da liberação do administrador.

1. Confirme com o administrador que o app Claude está aprovado no workspace.
2. No Claude, abra **Customize → Connectors**.
3. Localize **Slack** e clique em **Connect**.
4. Escolha o workspace correto e revise a autorização.
5. Faça o teste somente leitura:

```text
No Slack conectado, encontre até três mensagens do canal [canal] nos últimos sete dias que mencionem [projeto]. Retorne data, autor, canal e link. Não envie nem altere nada.
```

6. Escolha uma conversa ou thread útil e execute `/ingerir`.

Para desconectar, volte a **Customize → Connectors → Slack → Disconnect**. Se necessário, remova também o app nas configurações do Slack.

## Opção B — exportação oficial

É a rota mais previsível para histórico. Quem pode exportar e o que entra no arquivo variam por plano e papel. Em geral, a exportação de canais públicos é mais acessível; canais privados e mensagens diretas exigem planos, papéis ou aprovação adicionais.

Para um proprietário ou administrador autorizado:

1. No Slack Desktop, abra **Admin → Workspace settings → Security**.
2. Entre em **Import & export data → Export**.
3. Escolha o menor intervalo e escopo que cumprem o objetivo.
4. Inicie a exportação e baixe o ZIP quando o Slack avisar.
5. Não descompacte dentro do OS. Guarde o ZIP em local controlado.
6. Copie para `_inbox/` apenas o canal e período autorizados.
7. Execute `/ingerir` e registre workspace, canal, intervalo e limitações.

O ZIP normalmente traz mensagens e links de arquivos; os arquivos anexados podem não estar incluídos. Não interprete ausência de anexo como ausência de evidência.

## Privacidade

- Não use mensagens diretas para demonstração pública.
- Restrinja a busca a canais e projetos conhecidos.
- Não conclua que o resultado é completo sem registrar plano, escopo e período.
- Respeite a política de retenção e as regras internas da organização.
- Qualquer envio, reação, edição ou postagem exige aprovação específica.

## Critério de aceite

- workspace e conta confirmados;
- uma rota oficial foi usada;
- um canal e um período curto foram testados;
- nenhuma mensagem foi enviada ou alterada;
- fonte bruta e origem foram preservadas;
- limitações de canais privados, DMs e anexos foram registradas;
- forma de desconectar ou revogar foi comprovada.

## Fallback

Copie uma thread autorizada com data, canal, autores e link permanente. Salve como Markdown em `_inbox/` e execute `/ingerir`.
