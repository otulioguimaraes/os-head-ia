#!/usr/bin/env bash
set -euo pipefail

# Sincroniza as skills para as pastas que o Codex (.agents/skills) e o
# Claude Code (.claude/skills) descobrem sozinhos.
#
# Duas fontes:
#   skills/os/      skills do produto (atualizadas por /atualizar-os)
#   skills/minhas/  skills criadas pelo usuário (nunca tocadas pela atualização)
#
# As pastas de destino são geradas: qualquer coisa criada direto nelas some na
# próxima sincronização. Skill nova do usuário nasce em skills/minhas/<nome>/.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PRODUCT_DIR="$SCRIPT_DIR/os"
USER_DIR="$SCRIPT_DIR/minhas"

if [[ ! -d "$PRODUCT_DIR" ]]; then
  echo "ERRO: skills do produto não encontradas em $PRODUCT_DIR" >&2
  exit 1
fi

MERGED="$(mktemp -d)"
trap 'rm -rf -- "$MERGED"' EXIT

PRODUCT_COUNT=0
USER_COUNT=0

for skill_dir in "$PRODUCT_DIR"/*; do
  [[ -d "$skill_dir" ]] || continue
  cp -R "$skill_dir" "$MERGED/$(basename "$skill_dir")"
  PRODUCT_COUNT=$((PRODUCT_COUNT + 1))
done

if [[ -d "$USER_DIR" ]]; then
  for skill_dir in "$USER_DIR"/*; do
    [[ -d "$skill_dir" ]] || continue
    name="$(basename "$skill_dir")"
    if [[ ! -f "$skill_dir/SKILL.md" ]]; then
      echo "AVISO: skills/minhas/$name não tem SKILL.md; ignorada." >&2
      continue
    fi
    if [[ -e "$MERGED/$name" ]]; then
      echo "ERRO: skills/minhas/$name tem o mesmo nome de uma skill do produto. Renomeie a sua." >&2
      exit 1
    fi
    cp -R "$skill_dir" "$MERGED/$name"
    USER_COUNT=$((USER_COUNT + 1))
  done
fi

# Sincroniza NO LUGAR, sem apagar e recriar a pasta inteira. Apagar e recriar numa
# pasta sincronizada (iCloud "Mesa e Documentos", OneDrive, Dropbox) gera cópias de
# conflito como "sessao 2", que quebram o diagnóstico.
sync_target() {
  local target_root="$1" entry name skill_dir
  mkdir -p "$target_root"
  # 1) remove o que não é skill atual (inclui cópias de conflito "nome 2")
  for entry in "$target_root"/* "$target_root"/.[!.]*; do
    [[ -e "$entry" || -L "$entry" ]] || continue
    name="$(basename "$entry")"
    [[ -d "$MERGED/$name" ]] || rm -rf -- "$entry"
  done
  # 2) atualiza cada skill arquivo a arquivo
  for skill_dir in "$MERGED"/*; do
    [[ -d "$skill_dir" ]] || continue
    name="$(basename "$skill_dir")"
    if command -v rsync >/dev/null 2>&1; then
      rsync -rlt --delete --inplace "$skill_dir/" "$target_root/$name/"
    else
      mkdir -p "$target_root/$name"
      cp -R "$skill_dir/." "$target_root/$name/"
      (cd "$target_root/$name" && find . -mindepth 1 -depth | while IFS= read -r rel; do
        [[ -e "$skill_dir/$rel" ]] || rm -rf -- "$target_root/$name/$rel"
      done)
    fi
  done
}

sync_target "$OS_ROOT/.agents/skills"
sync_target "$OS_ROOT/.claude/skills"

echo "OK: $PRODUCT_COUNT skills do produto e $USER_COUNT suas sincronizadas para Codex e Claude Code."
