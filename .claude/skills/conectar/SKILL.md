---
name: conectar
description: Ajuda uma pessoa não técnica a escolher e testar uma fonte de contexto para o OS pelo caminho oficial mais simples, com leitura primeiro e fallback manual. Use em /conectar ou para reuniões, e-mail, agenda, mensageria, bases de conhecimento, projetos e arquivos.
---

# Conectar uma fonte

Ajude o usuário a dar ao OS acesso a uma fonte útil. Conectar é conseguir trazer contexto com origem conhecida; não significa obrigatoriamente instalar uma integração automática.

## Experiência obrigatória

- Comece pelo resultado desejado, não pela tecnologia.
- Trate uma fonte por vez.
- Recomende uma opção e permita que o usuário escolha outra.
- Não explique API, MCP, CLI, OAuth ou credenciais antes de isso ser realmente necessário.
- Quando a importação manual cumprir o objetivo, use-a como primeira vitória e deixe a automação como evolução opcional.

## 1. Escolher o que o OS deve enxergar

Se a fonte ainda não foi informada, pergunte:

```text
O que você quer que o OS enxergue primeiro?

1. Reuniões
2. E-mail e agenda
3. WhatsApp
4. Projetos e arquivos
5. Outra fonte
```

Explique o benefício em uma frase e só então avance.

## 2. Oferecer o menor caminho útil

Use esta ordem:

1. arquivo, anexo ou texto fornecido pelo usuário;
2. conector nativo ou MCP oficial já disponível no aplicativo;
3. exportação oficial feita pelo usuário;
4. ferramenta local confiável e documentada;
5. integração personalizada somente se as opções anteriores não cumprirem o objetivo;
6. escrita ou automação somente depois de um teste de leitura aprovado.

Consulte `guias/conexoes/README.md` para escolher o playbook. Leia apenas o guia da fonte selecionada.

### Reuniões

- Recomende começar com uma transcrição exportada ou anexada.
- Se o usuário já usa Fathom, Fireflies, Granola, tl;dv ou Plaud, pergunte qual deles e teste uma reunião.
- Leia `guias/conexoes/fathom.md` quando Fathom for escolhido.
- Leia `guias/conexoes/reunioes.md` para Fireflies, Granola, tl;dv ou Plaud.

### E-mail e agenda

- Pergunte se o aplicativo já oferece uma conexão nativa e prefira acesso somente leitura.
- Sem conector pronto, use um e-mail exportado e um recorte pequeno da agenda.
- Leia `guias/conexoes/google.md` apenas quando Google for escolhido e uma configuração real for necessária.

### WhatsApp

- Para a primeira vitória, aceite texto copiado ou conversa exportada pelo próprio usuário.
- Ofereça `wacli` apenas se o usuário quiser sincronização recorrente e aprovar a instalação.
- Leia `guias/conexoes/whatsapp-wacli.md` somente nesse caso.

### Slack

- Prefira o conector nativo oficial quando já estiver liberado; caso contrário, use exportação ou uma thread copiada.
- Restrinja o teste a um canal, projeto e período conhecidos. Mensagens diretas não entram em demonstrações.
- Leia `guias/conexoes/slack.md`.

### Notion e Obsidian

- Para Notion, prefira o MCP oficial por OAuth, começando por pesquisa e leitura.
- Para Obsidian, prefira uma subpasta local explicitamente autorizada; não copie o vault inteiro.
- Leia `guias/conexoes/notion-obsidian.md`.

### Telegram e Discord

- Prefira a exportação oficial. Bots ficam fora da primeira ativação porque exigem permissões e projeto técnico.
- Leia `guias/conexoes/telegram-discord.md`.

### Projetos e arquivos

- Prefira uma pasta que o usuário já abriu, um arquivo anexado ou uma URL fornecida.
- Só fale em clone quando o usuário disser que o projeto está no GitHub e quiser uma cópia local.
- Leia `guias/conexoes/github.md` apenas nessa rota.

Para configurar um MCP no Codex ou Claude, leia `guias/conexoes/conectores-codex-claude.md`. Para qualquer fonte sem guia, use `guias/conexoes/importacao-manual.md`. Não invente URL, endpoint, instalação ou capacidade.

## 3. Pedir autorização somente quando necessário

Antes de instalar, autenticar ou acessar uma conta:

1. explique em linguagem simples o que será acessado;
2. diga se é leitura ou escrita;
3. proponha o menor recorte de teste;
4. explique como desconectar;
5. peça aprovação explícita.

Nunca peça senha, token, cookie ou chave no chat ou em Markdown. Nunca procure credenciais por conta própria.

## 4. Testar uma unidade

Use uma reunião, um e-mail, uma conversa, um arquivo ou um projeto. Confirme:

- a fonte foi recebida e não está vazia;
- origem e período são conhecidos;
- o conteúdo pertence ao escopo autorizado;
- nenhuma escrita externa ocorreu;
- nenhum segredo foi salvo.

Depois preserve o original e use `/ingerir` para transformá-lo em contexto.

## 5. Registrar sem jargão

Crie ou atualize `conexoes/<slug>.md` a partir de `conexoes/MODELO.md` e atualize `conexoes.md`.

Estados:

- `MANUAL`: o usuário fornece o material;
- `EM_TESTE`: existe uma integração em validação;
- `LEITURA_OK`: uma leitura real foi comprovada;
- `DEGRADADO`: a integração falhou, mas há alternativa manual;
- `REVOGADO`: o acesso foi removido.

Na resposta ao usuário, traduza o estado:

```text
Pronto: o OS já consegue receber [fonte] por [forma simples].
Automação: [não necessária agora | disponível como próximo passo].
```

## Critério de pronto

- uma fonte foi testada ou um caminho manual funcional foi definido;
- a rota usada foi confirmada na documentação oficial quando envolve conexão externa;
- o estado foi registrado honestamente;
- nenhuma ação externa ocorreu sem aprovação;
- existe um próximo passo simples, sem obrigar automação.
