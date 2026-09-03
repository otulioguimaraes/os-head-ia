# Comece aqui

## 1. Prepare o ambiente

Instale e abra uma destas opções:

- Codex Desktop; ou
- Claude Code em um terminal.

Depois, abra **esta pasta inteira**. Não abra somente um arquivo.

## 2. Envie a primeira mensagem

Na primeira conversa, não dependa de um atalho. Envie esta mensagem completa:

```text
Leia as instruções desta pasta, prepare o OS para este aplicativo e comece meu onboarding. Não leia nada fora desta pasta, não instale programas e não conecte contas sem me explicar e pedir autorização.
```

O agente fará a preparação em segundo plano. Se tudo estiver certo, você verá apenas `Tudo pronto.` e a primeira pergunta do onboarding. Detalhes técnicos aparecem somente se algo falhar.

Depois do primeiro acesso, os atalhos ficam disponíveis. Você poderá usar normalmente:

```text
/iniciar
```

O agente deve perguntar pouco por vez, salvar cada avanço e permitir retomada.

Primeiro ele perguntará como você quer começar:

1. criar seu OS real do zero;
2. fazer uma demonstração fictícia;
3. importar seu M0 e/ou DNA;
4. retomar uma configuração.

Se você já fez os agentes fundacionais, escolha a terceira opção e entregue:

- o **M0 — Documento de Contexto do Negócio**;
- o **M2 — Documento de DNA**.

Eles são opcionais. O OS deve preservar os originais e perguntar apenas o que ainda estiver faltando.

## 3. Escolha o primeiro trabalho

O agente perguntará qual trabalho ou projeto você quer acompanhar primeiro. Basta explicar em uma frase. Pode ser um sistema construído no Lovable, um projeto do trabalho ou uma iniciativa pessoal.

GitHub só entra se você disser que o projeto está lá e quiser uma cópia local.

## 4. Escolha o que o OS deve enxergar

Depois dos dados principais, o agente perguntará:

```text
O que você quer que o OS enxergue primeiro?

1. Reuniões
2. E-mail e agenda
3. WhatsApp
4. Projetos e arquivos
5. Nada agora — quero usar uma importação simples
```

Você não precisa saber o que é API ou MCP. O agente escolherá com você o caminho mais simples. Para o primeiro teste, pode ser apenas:

- transcrição do Fathom;
- ata de reunião;
- arquivo Markdown, texto ou PDF;
- exportação de e-mail;
- notas copiadas manualmente.

Depois da primeira vitória, consulte o [catálogo de conexões](guias/conexoes/README.md) para Slack, Fireflies, Granola, tl;dv, Plaud, Notion, Obsidian, Telegram, Discord e outras fontes.

Se o aplicativo não estiver no catálogo, use `/search-connectors <nome do aplicativo>`. A skill pesquisará as rotas atuais, mas não instalará nem autenticará nada sem explicar e pedir autorização.

O original será preservado em `conhecimento/raw/` e o sistema criará uma nota útil. Conexão automática é opcional e pode ficar para depois.

## 5. Gere o primeiro briefing

Digite `/briefing-manha`. O briefing usará somente os dados disponíveis e dirá claramente o que ainda não está conectado.

## 6. Encerre sem perder o fio

Digite `/sessao`. O agente atualizará `memoria.md`, o log e `saidas/RETOMAR.md` com o próximo passo concreto.

Faça disso um ritual: **toda sessão de trabalho útil termina com `/sessao`**.

## 7. Complete o ciclo semanal depois

Quando já houver alguns dias de evidência, use:

1. `/fechar-semana` para separar entregas, decisões, pendências e aprendizados;
2. `/montar-semana` para escolher até três resultados que caibam na agenda real.

Sem agenda conectada, o plano será marcado como provisório. Nenhum evento será criado ou alterado automaticamente.

## Se algo der errado

Não apague nem reinstale a pasta. Mostre ao agente a mensagem de erro e peça:

```text
Diagnostique o meu OS sem apagar dados. Rode a verificação apropriada ao meu sistema operacional e proponha o próximo passo.
```

Consulte também [GUIA-DO-ALUNO.md](GUIA-DO-ALUNO.md).

Depois da aula, use [GUIA-COMPLETO-DO-OS.md](GUIA-COMPLETO-DO-OS.md) para evoluir do primeiro contexto até segundo cérebro, rotinas e Agentic OS.
