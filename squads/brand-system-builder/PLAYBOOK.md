# Brand System Builder — Playbook

Protocolo replicavel para construir um brand system completo para qualquer marca.

## Visao Geral

Este playbook transforma uma ideia de marca em um sistema de design completo com:
- Estrategia de marca (posicionamento, arquetipos, manifesto)
- Identidade visual (cores, tipografia, logo)
- Design tokens (JSON + CSS)
- Biblioteca de 60+ componentes UI
- Marketing sections, effects, templates, VFX
- SEO guidelines
- Preview HTML interativo
- Site completo do brand system

## Pré-requisitos

### Essencial

- uma pasta de projeto gravável;
- Codex ou Claude Code;
- referências e decisões aprovadas pelo usuário.

Python, PyYAML, Git e ferramentas de imagem são opcionais. Se uma dependência não existir, o agente pode produzir os mesmos documentos diretamente. Não instale pacotes, não use API paga e não gere imagens sem explicar e pedir autorização.

## Quickstart

### 1. Iniciar pelo OS

```text
/design-system
```

A skill faz a entrevista inicial, cria ou confirma a ficha do projeto e conduz os gates.

### 2. Scaffold opcional por script

```bash
cd squads/brand-system-builder/scripts
./init-brand.sh "Nome da Marca"
```

Isso cria:
- `brand-config.yaml` — Config central (preencher)
- `brand-output/` — Estrutura de diretorios

### 3. Preencher brand-config.yaml

Abra `brand-config.yaml` e preencha todos os campos. Este arquivo e o **single source of truth** — tudo no sistema le dele.

Campos obrigatorios:
- `brand.name`, `brand.tagline`, `brand.description`
- `brand.colors` (primary, cream, neutrals)
- `brand.typography` (heading, body, mono)
- `brand.voice.archetypes` (pelo menos 1)

### 4. Executar o pipeline

Leia `workflows/brand-system-pipeline.yaml` e execute as fases na ordem. Os arquivos em `agents/` definem responsabilidades e os arquivos em `tasks/` definem cada entrega. O modo padrão é interativo.

Não use modo autônomo para tomar decisões de identidade. Cores, tipografia, logo, posicionamento e direção visual exigem aprovação nos gates.

---

## As 7 Fases

### Fase 1: Discovery & Strategy
**Agente:** brand-strategist (Stratega)

| Task | Output | Interativo? |
|------|--------|-------------|
| `discover-brand` | positioning.md | Sim (8 perguntas) |
| `define-archetype` | archetype.md | Sim (selecao guiada) |
| `write-manifesto` | manifesto.md, brand-voice.md, moodboard.md | Nao |

**Gate:** Brand Strategy Checklist (43 items)

### Fase 2: Visual Identity
**Agente:** visual-designer (Prisma)

| Task | Output | Interativo? |
|------|--------|-------------|
| `design-identity` | color-palette.md, typography.md, logo-system.md, guidelines.md | Sim (aprovacao cores) |
| `generate-tokens` | colors.json, typography.json, tokens.css | Nao |

**Gate:** Visual Identity Checklist (56 items)

### Fase 3: Design Foundations
**Agente:** visual-designer (Prisma)

| Task | Output | Interativo? |
|------|--------|-------------|
| `build-foundations` | spacing.json, shadows.json, motion.json | Nao |

### Fase 4: Component Library
**Agente:** component-builder (Forge)

| Task | Output | Interativo? |
|------|--------|-------------|
| `build-components` | 60+ componentes (HTML + docs) | Nao |
| `audit-components` | audit-report.md | Nao |

**Gate:** Component Quality Checklist (62 items)

### Fase 5: Marketing Sections & Effects
**Agentes:** component-builder + visual-designer

| Task | Output | Interativo? |
|------|--------|-------------|
| `build-sections` | sections.html (10 marketing sections) | Nao |
| `build-effects` | effects.html (8 categorias de efeitos) | Nao |

### Fase 6: Templates, VFX & SEO
**Agentes:** component-builder + visual-designer + brand-assembler

| Task | Output | Interativo? |
|------|--------|-------------|
| `build-templates` | templates.html (6 layout templates) | Nao |
| `build-vfx` | vfx.html (7 sistemas VFX) | Nao |
| `build-seo` | seo.html (meta, OG, JSON-LD, favicons) | Nao |

### Fase 7: Assembly & Delivery
**Agente:** brand-assembler (Atlas)

| Task | Output | Interativo? |
|------|--------|-------------|
| `assemble-brandbook` | docs/ organizados | Nao |
| `build-preview` | preview/index.html | Nao |
| `build-site` | site/ completo | Sim (estrutura) |

**Gate:** Delivery Checklist (79 items)

---

## Estrutura de Output

```
brand-output/
├── docs/
│   ├── 01-strategy/     ← Posicionamento, arquetipo, manifesto, voz, moodboard
│   ├── 02-identity/     ← Paleta, tipografia, logo, guidelines
│   ├── 03-foundations/  ← Spacing, grid, shadows, motion
│   ├── 04-components/   ← Specs de componentes, sections, effects, templates
│   └── 05-delivery/     ← SEO, delivery README
├── tokens/
│   ├── colors.json
│   ├── typography.json
│   ├── spacing.json
│   ├── shadows.json
│   ├── motion.json
│   └── tokens.css       ← CSS custom properties consolidado
├── preview/
│   ├── index.html        ← Hub de navegacao
│   ├── brandbook.html
│   ├── foundations.html
│   ├── components.html
│   ├── sections.html
│   ├── effects.html
│   ├── templates.html
│   ├── vfx.html
│   ├── seo.html
│   └── motion.html
├── site/
│   ├── index.html
│   ├── styles.css
│   └── script.js
└── mockups/
    └── mockup-prompts.md  ← Prompts para IA
```

## brand-config.yaml

O `brand-config.yaml` e o coracao do sistema. Todos os tasks, templates HTML e scripts leem deste arquivo.

### Secoes principais:

| Secao | Proposito |
|-------|-----------|
| `brand.name/tagline/description` | Identidade basica |
| `brand.logo` | Sistema de logo (primary, icon, minimal, tri-color) |
| `brand.symbols` | Simbolos proprietarios com significado |
| `brand.colors` | Paleta completa (primary, neutrals, semantic) |
| `brand.typography` | Familias tipograficas e escala |
| `brand.voice` | Arquetipos, tom, vocabulario |
| `brand.founders` | Informacoes do fundador |
| `brand.personas` | Publico-alvo |
| `brand.hero_journey` | Narrativa em 4 atos |
| `brand.brandscript` | Framework StoryBrand SB7 |
| `brand.brand_contract` | Promessas e demandas |
| `brand.seo` | Configuracao SEO/social |
| `brand.pages` | Lista de paginas para navegacao |

## Scripts Utilitarios

### init-brand.sh
Scaffold de novo projeto. Cria diretorios e copia template de config.

```bash
./scripts/init-brand.sh "Minha Marca"
```

### generate-tokens.py
Le `brand-config.yaml` e gera tokens JSON + CSS.

```bash
python3 scripts/generate-tokens.py --config brand-config.yaml --output brand-output/tokens/
```

### generate-mockups.py
Gera prompts de mockup para ferramentas de IA.

```bash
python3 scripts/generate-mockups.py --config brand-config.yaml --output brand-output/mockups/
```

## Checklists de Qualidade

Cada gate de fase tem um checklist formal:

| Gate | Checklist | Items |
|------|-----------|-------|
| Fase 1 | `brand-strategy-checklist.md` | 43 |
| Fase 2-3 | `visual-identity-checklist.md` | 56 |
| Fase 4 | `component-quality-checklist.md` | 62 |
| Fase 7 | `delivery-checklist.md` | 79 |

## Dados de Referencia

| Arquivo | Conteudo |
|---------|----------|
| `data/jung-archetypes.yaml` | 12 arquetipos com traits, valores, cores, marcas exemplo |
| `data/color-psychology.yaml` | 11 cores com emocoes, industrias, personalidade |
| `data/typography-pairings.yaml` | 5 categorias de pareamento tipografico |

---

*Brand System Builder Playbook v1.1 | Adaptado para execução nativa no OS Head de IA*
