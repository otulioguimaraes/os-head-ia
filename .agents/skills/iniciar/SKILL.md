---
name: iniciar
description: Configura ou retoma o OS Head de IA com uma conversa guiada e simples, conduzindo da identidade à primeira fonte conectada, briefing e ponto de retomada. Use no primeiro acesso, em /iniciar ou para continuar um onboarding interrompido.
---

# Iniciar o OS

Conduza uma pessoa não técnica até a primeira vitória do OS sem transformar o onboarding numa configuração de software.

## Experiência obrigatória

- Fale em português simples. Não exponha nomes de scripts, contagens, `diff`, API, MCP, CLI ou detalhes internos quando tudo estiver funcionando.
- Faça uma decisão por vez e no máximo três perguntas curtas por mensagem.
- Antes de executar várias etapas, diga em uma frase o que acontecerá e qual resultado será salvo.
- Salve cada checkpoint antes de avançar. Se algo demorar, informe o progresso em linguagem humana.
- Quando o usuário disser “sem preferência”, recomende a opção mais simples e peça confirmação. Isso não autoriza consultar outras pastas ou escolher dados reais.
- Não exija conexão automática. Uma importação manual pode comprovar o fluxo.
- No primeiro acesso bem-sucedido, não faça relatório da preparação. A resposta visível deve começar com `Tudo pronto.` e seguir diretamente para a escolha do modo.

## Fronteiras

- Durante o onboarding, leia apenas arquivos dentro da raiz deste OS.
- Nunca procure M0, M2, perfil, prioridades, projetos ou documentos em outras pastas. Use uma fonte externa somente quando o usuário anexar o arquivo ou indicar o caminho e confirmar a leitura.
- Não instale programas, não autentique contas e não conecte serviços sem explicar a ação e receber aprovação.
- Não altere `skills/`, `.agents/`, `.claude/`, `ferramentas/`, `AGENTS.md`, `CLAUDE.md`, `COMECE-AQUI.md`, `GUIA-*.md` ou `CHECKLIST-ACEITE.md` durante o uso normal. Esses arquivos pertencem ao produto, não ao contexto do aluno.

## 1. Descobrir o modo

Antes de escrever qualquer resposta, leia `memoria.md`, `saidas/RETOMAR.md`, `0-eu/perfil.md`, `0-eu/prioridades.md` e `conexoes.md`.

Esta bifurcação é obrigatória:

- se `memoria.md` contiver `onboarding: concluído` ou `onboarding: concluído com DEMO`, é proibido mostrar o menu “Como você quer começar?”;
- se contiver `onboarding: em andamento`, retome a primeira pendência registrada e peça confirmação;
- somente `onboarding: não iniciado` pode abrir o menu de quatro modos.

Se o onboarding já estiver concluído, não execute automaticamente o próximo passo. Mostre um resumo curto e pergunte se o usuário quer:

1. retomar o próximo passo registrado;
2. conectar uma nova fonte;
3. consultar o que o OS já sabe;
4. apenas revisar o estado.

Se ainda não começou, diga `Tudo pronto.` e faça somente esta primeira pergunta:

```text
Como você quer começar?

1. Criar meu OS real do zero (recomendado)
2. Fazer uma demonstração com dados fictícios
3. Importar meu M0 e/ou DNA
4. Retomar uma configuração já iniciada
```

Regras do modo:

- **real do zero:** não leia nada fora desta pasta;
- **demonstração:** use somente `dados-demo/` e marque tudo como `DEMO`;
- **importar:** use apenas os arquivos anexados ou caminhos explicitamente aprovados;
- **retomar:** preserve o que já existe, mostre a primeira lacuna e peça confirmação antes de continuar.

Registre o modo em `memoria.md`.

## 2. Capturar os dados principais

Pergunte:

1. nome, papel atual e empresa ou contexto;
2. prioridade mais importante para as próximas semanas;
3. como prefere receber respostas e o que a IA nunca deve fazer sem aprovação.

Atualize `0-eu/perfil.md` e `0-eu/prioridades.md`. Mostre apenas:

```text
Primeiro checkpoint salvo: quem você é, o que importa agora e seus limites.
```

### M0 e DNA

Somente no modo **importar**, aceite:

- M0 — contexto do negócio;
- M2/DNA — história, voz, valores e forma de trabalhar.

Preserve o original em `conhecimento/raw/fundacionais/`, extraia apenas fatos explícitos, cite a origem e proponha o merge antes de sobrescrever algo existente. Não repita perguntas já respondidas pelos documentos.

## 3. Registrar o primeiro trabalho

Pergunte em linguagem simples:

```text
Qual trabalho ou projeto você quer que este OS ajude a acompanhar primeiro?
```

Não mencione Git ou GitHub a menos que o usuário diga que o projeto está lá. Leia e execute `skills/os/registrar-projeto/SKILL.md`. Se ainda não houver um projeto, aceite uma iniciativa descrita em uma frase. Não invente dados reais.

## 4. Escolher a primeira conexão

Depois dos dados principais e do primeiro trabalho, pergunte:

```text
O que você quer que o OS enxergue primeiro?

1. Reuniões
2. E-mail e agenda
3. WhatsApp
4. Projetos e arquivos
5. Nada agora — quero usar uma importação simples
```

Trate somente uma opção nesta ativação. Leia e execute `skills/os/conectar/SKILL.md`, informando a opção escolhida e que o contexto é onboarding.

Escolha sempre o menor caminho que comprova o objetivo:

- uma transcrição ou arquivo antes de automação;
- um conector nativo já disponível antes de instalar ferramentas;
- somente leitura antes de escrita;
- um item de teste antes de histórico completo.

Se o usuário não quiser conectar nada, peça uma fonte pequena ou ofereça um arquivo de `dados-demo/`. A conexão automática pode ficar para depois.

## 5. Transformar a primeira fonte em contexto

Quando a etapa anterior produzir uma reunião, e-mail, conversa, arquivo ou texto, leia e execute `skills/os/ingerir/SKILL.md`.

Confirme em linguagem simples:

- o original foi preservado;
- o OS criou uma nota útil;
- nenhuma conta foi alterada.

## 6. Produzir a primeira saída

Leia e execute `skills/os/briefing-manha/SKILL.md`. O briefing pode ser parcial, mas deve declarar o que foi usado, o que ainda falta e a ação prioritária.

## 7. Fechar a ativação

Leia e execute `skills/os/sessao/SKILL.md` no modo de encerramento.

Atualize `memoria.md` com:

- `onboarding: concluído`, quando projeto e fonte forem reais;
- `onboarding: concluído com DEMO`, quando o ciclo usar demonstração;
- projeto ativo;
- primeira conexão ou importação escolhida;
- fontes disponíveis;
- próximo passo de até 30 minutos.

Finalize com um placar simples:

```text
Seu OS está ativo.

✓ perfil e prioridade
✓ primeiro trabalho
✓ primeira fonte
✓ briefing
✓ ponto de retomada

Agora use o OS normalmente e encerre trabalhos úteis com /sessao.
Para adicionar outra fonte depois, use /conectar.
```

Inclua links relativos para os arquivos criados, sem transformar a resposta num relatório técnico.

## Critério de pronto

Só declare a ativação concluída quando existirem:

- perfil mínimo e prioridade;
- ficha de trabalho ou projeto;
- uma fonte bruta e nota derivada;
- briefing e ponto de retomada.

Uma conexão em estado `MANUAL` é suficiente para a primeira vitória. Material fictício conclui somente a ativação didática e deve permanecer marcado como `DEMO`. Se algo faltar, use `onboarding: em andamento` e registre uma próxima ação clara.
