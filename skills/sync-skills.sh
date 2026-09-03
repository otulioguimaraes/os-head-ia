#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_DIR="$SCRIPT_DIR/os"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "ERRO: skills canônicas não encontradas em $SOURCE_DIR" >&2
  exit 1
fi

sync_target() {
  local target_root="$1"
  if [[ -d "$target_root" ]] && diff -qr "$SOURCE_DIR" "$target_root" >/dev/null 2>&1; then
    return
  fi
  if [[ -d "$target_root" ]]; then
    rm -rf -- "$target_root"
  fi
  mkdir -p "$target_root"

  local skill_dir
  for skill_dir in "$SOURCE_DIR"/*; do
    [[ -d "$skill_dir" ]] || continue
    local skill_name
    skill_name="$(basename "$skill_dir")"
    cp -R "$skill_dir" "$target_root/$skill_name"
  done
}

sync_target "$OS_ROOT/.agents/skills"
sync_target "$OS_ROOT/.claude/skills"

COUNT="$(find "$SOURCE_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
echo "OK: $COUNT skills sincronizadas para Codex e Claude Code."
