---
name: atualizar-os
description: Atualiza um OS Head de IA já em uso para uma versão nova do pacote sem tocar nos dados do usuário. Use em /atualizar-os, "atualize meu OS", "baixei a versão nova", ou quando o usuário apontar a pasta de um pacote mais novo.
---

# Atualizar o OS sem perder nada

O usuário já trabalha neste OS. Perfil, conhecimento, decisões, projetos e sessões são dele. A atualização troca **só arquivos do produto** e guarda os antigos em `_arquivo/`.

## 1. Achar a versão nova

Pergunte onde está a pasta da versão nova, já descompactada (ex.: `Downloads/os-head-ia-v0.6`). Não procure no computador por conta própria.

Confirme que a pasta indicada tem `VERSAO.md`, `skills/os/` e `ferramentas/atualizar-os.sh`. Leia a versão nos dois `VERSAO.md` e diga: *"Seu OS está na versão X. A nova é a Y."*

Se a pasta indicada for a própria pasta deste OS, pare e explique: o usuário precisa baixar a versão nova em outro lugar.

## 2. Mostrar o plano antes de mexer

Rode, **a partir da pasta da versão nova**, apontando para a pasta deste OS:

- Mac, Linux ou Windows com Git Bash (o terminal que o Claude Code usa no Windows): `bash "<pasta-nova>/ferramentas/atualizar-os.sh" "<pasta-deste-os>"` — use barras `/` e **sempre aspas** (nomes com espaço, OneDrive);
- Windows pelo PowerShell: `powershell -ExecutionPolicy Bypass -File "<pasta-nova>\ferramentas\atualizar-os.ps1" "<pasta-deste-os>"`.

Sem `--aplicar` (ou `-Aplicar`), o script só mostra o plano. Explique o plano em linguagem simples:

- o que é novo e o que é atualizado;
- que nada de `0-eu/`, `empresa/`, `conhecimento/`, `decisoes/`, `projetos/`, `_inbox/`, `rotinas/`, `saidas/`, `dados/`, `entrada/`, `skills/minhas/`, `memoria.md` e `conexoes.md` será tocado;
- quais skills dele serão guardadas em `skills/minhas/` (linha "Skills SUAS…" do plano);
- a diferença no `AGENTS.md` e no `CLAUDE.md`, se houver. Se o usuário tinha mudado esses arquivos, mostre o trecho dele que sairia e pergunte se quer reaplicar depois.

Peça aprovação explícita.

## 3. Aplicar

Com o OK, rode o mesmo comando com `--aplicar` (Mac/Linux) ou `-Aplicar` (Windows).

O script:

1. resgata para `skills/minhas/` as skills que o usuário criou em `skills/os/`, `.claude/skills/` ou `.agents/skills/` (qualquer skill que nunca veio no pacote); arquivos extras dele dentro de pastas do produto ficam onde estão;
2. tira uma impressão digital dos dados do usuário;
3. troca os arquivos do produto **um a um**, movendo cada antigo para `_arquivo/atualizacao-<data>/` (nada é apagado);
4. confere que a impressão digital dos dados não mudou;
5. sincroniza as skills e roda o diagnóstico.

Se o script disser que os dados mudaram, pare e mostre a mensagem inteira ao usuário.

## 4. Fechar

- Mostre a linha `OK: seus dados estão intactos` e o resultado do diagnóstico.
- Diga em uma frase o que a versão nova trouxe (leia `VERSAO.md`).
- Registre em `conhecimento/log.md`: `## [AAAA-MM-DD] manutencao — OS atualizado de X para Y`.
- Se o usuário tinha mudanças próprias no `AGENTS.md`/`CLAUDE.md`, ofereça reaplicar a partir da cópia em `_arquivo/`.
- Diga ao usuário: **feche esta conversa e abra uma nova na pasta do OS** — as skills novas só aparecem numa conversa nova.
- Na conversa nova, recomende `/sessao` ao fim do trabalho.

## Nunca

- Copiar a pasta nova por cima da pasta do usuário.
- Apagar arquivos. O que sai vai para `_arquivo/`.
- Mexer em dados do usuário para "acomodar" a versão nova.
