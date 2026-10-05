# Guia do aluno — primeira ativação

## Objetivo da prática

Sair da aula com um OS que conhece uma prioridade, um projeto e uma fonte real, e que consegue produzir uma saída útil sem depender da memória do chat.

Tempo estimado: 25 a 35 minutos.

## Antes da aula

- instale Codex Desktop ou Claude Code;
- tenha acesso a uma pasta onde possa criar arquivos;
- se possível, separe um projeto real e uma transcrição curta;
- não leve senhas ou chaves para colar na conversa.

Passo a passo por sistema: [GUIA-INSTALACAO.md](GUIA-INSTALACAO.md).

## Durante a aula

### 1. Baixar e abrir — 5 min

1. Baixe o ZIP ou clone o repositório entregue pelo professor.
2. Se for ZIP, descompacte-o em Documentos ou outra pasta de trabalho.
3. Abra a pasta `os-head-ia-v0.6` inteira no agente.
4. Copie a mensagem de primeiro acesso de `COMECE-AQUI.md` e envie ao agente.

### 2. Iniciar — 8 min

O agente preparará o OS e perguntará se você quer uso real, demonstração, importação de M0/DNA ou retomada. Escolha uma opção e responda de forma curta. Observe que, após cada etapa, o agente atualiza arquivos; a conversa não é a única memória.

### 3. Registrar projeto — 5 min

Use um projeto real. Se ele estiver no GitHub, registre a URL e clone apenas se houver tempo e uma pasta externa confirmada. Se estiver no Lovable sem GitHub, conclua a integração como exercício de casa.

### 4. Escolher e ingerir uma fonte — 7 min

Escolha o que quer que o OS enxergue primeiro: reuniões, e-mail/agenda, WhatsApp, projetos/arquivos ou importação simples. Use apenas uma fonte pequena. Se isso não for possível, use `dados-demo/reuniao-fathom.md`. Confira:

- fonte em `conhecimento/raw/`;
- nota em `conhecimento/paginas/`;
- origem citada;
- marcação DEMO, se aplicável.

### 5. Gerar e fechar — 5 min

Execute `/briefing-manha` e depois `/sessao`. Abra `saidas/RETOMAR.md` e confirme que outra sessão saberia continuar.

## Em casa

1. conectar o projeto Lovable ao GitHub e registrar o clone;
2. importar uma reunião real do Fathom;
3. executar `/mapear-fontes` para priorizar as próximas fontes do trabalho;
4. escolher uma conexão adicional em `guias/conexoes/` ou pesquisar outra com `/search-connectors`;
   comece pelo [catálogo de conexões](guias/conexoes/README.md) e teste somente uma fonte por vez;
5. depois de alguns dias, executar `/fechar-semana`;
6. executar `/montar-semana` e conferir se o plano cabe na agenda;
7. criar outra rotina com `/criar-rotina` e executá-la manualmente;
8. nunca automatizar envio antes de validar a saída.

Para continuar a construção em etapas, siga [GUIA-COMPLETO-DO-OS.md](GUIA-COMPLETO-DO-OS.md). O mesmo conteúdo está em PDF para ser enviado a uma IA e usado como playbook guiado.

## Critério de entrega

Envie ao professor ou monitor uma captura ou cópia redigida de:

- `memoria.md` com onboarding concluído ou etapa exata;
- ficha do projeto;
- nota derivada sem dados sensíveis;
- primeiro briefing;
- `saidas/RETOMAR.md`.
