# Suas skills

Esta pasta guarda as skills que **você** cria. As skills que vêm com o OS ficam em `skills/os/`.

## Como nasce uma skill sua

1. Resolva uma tarefa numa conversa até o resultado ficar bom.
2. Peça: *"Agora crie uma skill para isso."*
3. A skill nasce em `skills/minhas/<nome-da-skill>/SKILL.md`.
4. O OS roda a sincronização (`skills/sync-skills.sh` no Mac e no Linux, `skills\sync-skills.ps1` no Windows). Assim a skill aparece no Claude e no Codex.

## Por que aqui, e não em `.claude/skills/`

As pastas `.claude/skills/` e `.agents/skills/` são **geradas**. A sincronização apaga e recria essas pastas. O que for criado direto nelas some.

A atualização do OS (`/atualizar-os`) troca as skills de `skills/os/` e **nunca toca nesta pasta**.

## Regras

- Um nome por skill, em `kebab-case` (ex.: `analisar-fatura`).
- Não use o nome de uma skill do produto. A sincronização recusa nomes repetidos.
- Toda skill tem `SKILL.md` com: nome, quando usar, entradas, passos, critério de pronto e o que ela nunca faz sem aprovação.
