# Telegram e Discord — comunidades e conversas

Objetivo: trazer somente conversas autorizadas e relevantes, sem criar um coletor amplo na primeira ativação.

Documentação oficial verificada em `2026-09-01`:

- Telegram Desktop — exportação: <https://telegram.org/blog/export-and-more>
- Telegram — introdução a bots: <https://core.telegram.org/bots>
- Telegram — mensagens visíveis a bots: <https://core.telegram.org/bots/faq>
- Discord — pacote de dados: <https://support.discord.com/hc/en-us/articles/360004957991-Your-Discord-Data-Package>
- Discord — Gateway e intents: <https://docs.discord.com/developers/events/gateway>

## Telegram — rota recomendada: exportação oficial

Use o Telegram Desktop atualizado:

1. Abra **Settings → Export Telegram data** para um pacote amplo; ou
2. abra uma conversa, use o menu `…` e escolha **Export chat history**.
3. Escolha o menor intervalo e somente as mídias necessárias.
4. Prefira JSON quando o conteúdo será processado; HTML é mais fácil para leitura humana.
5. Preserve o pacote fora do OS e copie para `_inbox/` apenas a conversa autorizada.
6. Execute `/ingerir` informando chat, período e formato.

### Por que não começar com bot

Um bot não é um espelho automático do histórico pessoal. Ele só recebe conversas em que participa e, em grupos, o modo de privacidade limita as mensagens visíveis por padrão. Criar um bot exige programação, token, hospedagem e consentimento do grupo.

Use bot apenas para um fluxo futuro claramente definido. O token criado pelo BotFather é uma credencial: nunca o coloque no chat ou no repositório.

## Discord — rota recomendada: pacote de dados

1. Abra **User Settings → Data & Privacy**.
2. Em **Request your data**, selecione apenas as categorias necessárias.
3. Confirme a solicitação.
4. O Discord pode levar até 30 dias para entregar o pacote por e-mail; o link de download também possui prazo.
5. Preserve o ZIP fora do OS.
6. Selecione as mensagens ou servidores autorizados e execute `/ingerir`.

O pacote contém arquivos JSON com dados da conta, mensagens e servidores conforme a seleção e a disponibilidade. Registre a data da solicitação e o período realmente presente.

### Por que não começar com bot

Um bot do Discord exige um aplicativo no Developer Portal, instalação no servidor e permissões explícitas. Para ler conteúdo de mensagens, pode ser necessário o `MESSAGE_CONTENT`, que é um intent privilegiado e possui regras próprias. Um bot também não deve ser usado para contornar permissões do usuário ou do servidor.

Deixe essa rota para um projeto técnico separado, com administrador do servidor, política de retenção e escopo aprovados.

## Critério de aceite

- conversa, grupo ou servidor autorizado;
- exportação veio do aplicativo ou da documentação oficial;
- período e participantes conhecidos;
- só o recorte necessário entrou no OS;
- mídia desnecessária foi excluída do escopo;
- nenhuma credencial foi salva;
- limitações de histórico e permissões foram registradas.

## Fallback rápido

Copie manualmente uma conversa curta, incluindo plataforma, canal/chat, data, autores e link quando existir. Salve como Markdown em `_inbox/` e execute `/ingerir`.
