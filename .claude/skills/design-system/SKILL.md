---
name: design-system
description: Documenta uma identidade visual existente ou conduz a criação e reconstrução de um design system completo com estratégia, tokens, componentes e preview. Use em /design-system, ao extrair marca de site, print ou PDF, ou ao criar uma marca e design system do zero.
---

# Design system

Conduza o usuário até uma referência visual reutilizável. Primeiro descubra se a marca **já existe** ou se precisa ser **criada/reformulada**. Não misture os dois trabalhos.

## Primeira decisão

Pergunte:

```text
Qual é o seu ponto de partida?

1. Minha marca já existe; quero documentar o que ela usa.
2. Quero criar ou reformular a identidade e o sistema visual.
3. Não sei; quero que você avalie minhas referências.
```

Se houver material consistente e aprovado, use **EXTRAIR**. Se não houver identidade definida, ou o usuário pedir criação/rebranding, use **CONSTRUIR**. No modo 3, examine apenas as referências fornecidas e explique a recomendação antes de produzir arquivos.

## Regras comuns

- Separe sempre `confirmado`, `inferido`, `proposto` e `pendente`.
- Nunca trate uma inferência visual como decisão aprovada.
- Nunca redesenhe um logo existente. Se faltar o vetor, registre a pendência.
- Não leia sites, pastas ou arquivos fora do OS sem o usuário fornecer a referência ou aprovar o caminho.
- Não instale dependências, gere imagens por API, publique nem substitua arquivos externos sem explicar e pedir autorização.
- Faça checkpoints antes de consolidar cores, tipografia, logo ou componentes.
- Salve o trabalho em `projetos/<slug>/design-system/` quando houver um projeto registrado. Se não houver, confirme um slug e crie a ficha com `/registrar-projeto` antes.

## Modo EXTRAIR — marca existente

Leia `skills/os/design-system/references/extrair-marca.md`.

Entregas mínimas:

- `EVIDENCIAS.md` com fontes e confiança;
- `DESIGN-SYSTEM.md` com cores, tipografia, superfícies, espaçamento, ícones e regras disponíveis;
- `tokens.css` com apenas valores confirmados;
- `design-system.html` como referência visual navegável;
- `PENDENCIAS.md` para lacunas que não podem ser inventadas.

Use `skills/os/design-system/assets/reference-template.html` apenas como esqueleto. A linguagem visual vem da marca. O Brand Book A4 e o PDF são opcionais; só produza quando o usuário pedir ou quando já fizerem parte do escopo.

## Modo CONSTRUIR — marca nova ou rebranding

Use o squad em `squads/brand-system-builder/`.

1. Leia `squads/brand-system-builder/PLAYBOOK.md` e `workflows/brand-system-pipeline.yaml`.
2. Execute o pipeline em modo interativo. Os arquivos YAML descrevem papéis e tarefas; não exija runtime AIOX.
3. Comece por `brand-strategist`, avance para `visual-designer`, depois `component-builder` e finalize com `brand-assembler`.
4. Pare nos quatro gates: estratégia, identidade, componentes e entrega.
5. Use `brand-config.yaml` como fonte única de decisões aprovadas.
6. Rode scripts somente quando forem úteis e as dependências já existirem. Se não existirem, produza os mesmos arquivos diretamente; não instale nada sem aprovação.

O modo completo pode entregar estratégia, identidade, tokens, fundações, biblioteca de componentes, seções de marketing, templates e site. Para uma primeira versão, combine com o usuário quais fases são necessárias; não gere 60 componentes sem um produto que os use.

## Encerramento

Registre:

- modo usado e motivo;
- fontes consultadas;
- decisões aprovadas;
- inferências ainda não validadas;
- arquivos produzidos;
- próximo gate.

Atualize a ficha do projeto e `saidas/RETOMAR.md`. Se o design system passar a orientar novas entregas, registre a decisão em `decisoes/log.md`.

## Critério de pronto

- o caminho EXTRAIR ou CONSTRUIR foi escolhido conscientemente;
- nenhuma informação de marca foi promovida sem fonte ou aprovação;
- tokens e componentes apontam para decisões rastreáveis;
- existe uma referência visual aberta e conferível;
- pendências e próximo gate estão explícitos.
