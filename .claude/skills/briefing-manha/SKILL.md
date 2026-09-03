---
name: briefing-manha
description: Gera um briefing diário priorizado a partir das fontes realmente disponíveis no OS, sem fingir conexões ausentes. Use em /briefing-manha, no início do dia ou para demonstrar como contexto acumulado vira atenção e ação.
---

# Gerar briefing da manhã

Transforme contexto disperso em um plano curto para o dia.

## 1. Determinar o período

Use a data local atual. Pergunte apenas se o usuário quiser outro dia ou fuso.

## 2. Ler fontes locais

Consulte, quando existirem:

- `0-eu/prioridades.md`;
- `memoria.md` e `saidas/RETOMAR.md`;
- fichas em `projetos/`;
- decisões e pendências recentes;
- fontes processadas recentemente;
- dados de agenda, comunicação e reuniões já importados.

Não afirme ter lido e-mail, agenda, WhatsApp ou Fathom se a conexão ou importação não existir.

## 3. Priorizar

Avalie cada item por:

- urgência real e prazo;
- impacto na prioridade atual;
- compromisso assumido com outra pessoa;
- bloqueio que destrava trabalho;
- energia ou janela de agenda disponível, se conhecida.

Não transforme toda pendência em prioridade.

## 4. Criar o arquivo

Salve em `saidas/diario/AAAA-MM-DD-briefing.md`:

```markdown
# Briefing — AAAA-MM-DD

## O que merece atenção hoje
1. ... — motivo e fonte

## Agenda e compromissos

## Respostas e acompanhamentos

## Riscos e bloqueios

## Plano realista
- agora:
- depois:
- se houver tempo:

## Fontes usadas

## Contexto ausente
```

Cite caminhos relativos. Marque dados de demonstração como `DEMO` no título e no corpo.

## 5. Fechar

Apresente as três atenções principais e pergunte se o usuário quer ajustar a ordem. Não envie mensagens nem altere agenda. Atualize `memoria.md` somente se a prioridade ou o próximo passo mudar.

