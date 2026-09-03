# Brand System Builder

Squad para construir brand systems completos e replicáveis. Dentro do OS Head de IA, ele é conduzido pela skill `/design-system`; os YAMLs funcionam como contratos de papéis, tarefas e gates, sem exigir um runtime específico.

## Quickstart

```text
/design-system
```

A skill identifica se a marca já existe. Se ela precisar ser criada ou reformulada, conduz este pipeline em modo interativo e pede aprovação nos gates. Os scripts são auxiliares e nunca devem disparar instalação ou gasto sem autorização.

## Pipeline (7 Fases)

| Fase | Agente | Output |
|------|--------|--------|
| 1. Discovery & Strategy | brand-strategist | Posicionamento, arquétipo, manifesto, voz, moodboard |
| 2. Visual Identity | visual-designer | Cores, tipografia, logo, guidelines, tokens |
| 3. Design Foundations | visual-designer | Spacing, grid, shadows, motion tokens |
| 4. Component Library | component-builder | 60+ componentes UI, audit de qualidade |
| 5. Marketing & Effects | component-builder + visual-designer | 10 sections, 8 categorias de efeitos |
| 6. Templates, VFX & SEO | component-builder + visual-designer + brand-assembler | 6 templates, 7 VFX, SEO guidelines |
| 7. Assembly & Delivery | brand-assembler | Docs, preview HTML, site interativo |

## brand-config.yaml

O `brand-config.yaml` é o **single source of truth** do sistema. Todos os tasks, templates e scripts lêem deste arquivo.

```bash
# Gerar scaffold com config
./scripts/init-brand.sh "Minha Marca"

# Gerar tokens a partir do config
python3 scripts/generate-tokens.py

# Gerar prompts de mockup
python3 scripts/generate-mockups.py
```

## Agentes

| Agente | Persona | Escopo |
|--------|---------|--------|
| brand-strategist | Stratega | Discovery, arquétipos, manifesto |
| visual-designer | Prisma | Identidade visual, tokens, foundations |
| component-builder | Forge | 60+ componentes UI, a11y audit |
| brand-assembler | Atlas | Montagem final e delivery |

## Componentes

| Tipo | Qtd | Detalhes |
|------|:---:|---------|
| Agentes | 4 | strategist, designer, builder, assembler |
| Tasks | 16 | 3 discovery + 2 identity + 1 foundations + 2 components + 5 marketing/effects/templates + 3 delivery |
| Workflows | 1 | brand-system-pipeline (7 fases) |
| Templates | 8 | 6 markdown + brand-config + HTML page |
| Checklists | 4 | 1 por gate de fase |
| Data | 3 | archetypes, colors, typography |
| Scripts | 3 | init, tokens, mockups |

## Documentação

- **[PLAYBOOK.md](PLAYBOOK.md)** — Protocolo completo documentado
- **[squad.yaml](squad.yaml)** — Configuração do squad

## Entrada pelo OS

```text
/design-system           → decide entre extrair e construir
/design-system construir → inicia ou retoma o pipeline deste squad
```

O usuário pode pedir uma fase específica em linguagem natural. Sempre respeite as dependências e os checkpoints do pipeline.
