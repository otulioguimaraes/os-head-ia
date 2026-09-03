#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

count_md() {
  local dir="$1"
  find "$dir" -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' '
}

printf 'OS Head de IA — status\n\n'
grep -E '^-( onboarding| atualizado em| foco atual):' "$OS_ROOT/memoria.md" 2>/dev/null || true
printf '\nProjetos: %s\n' "$(find "$OS_ROOT/projetos" -maxdepth 1 -type f -name '*.md' ! -name README.md | wc -l | tr -d ' ')"
printf 'Fontes brutas: %s\n' "$(find "$OS_ROOT/conhecimento/raw" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
printf 'Páginas de conhecimento: %s\n' "$(count_md "$OS_ROOT/conhecimento/paginas")"
printf 'Briefings: %s\n' "$(find "$OS_ROOT/saidas/diario" -type f -name '*-briefing.md' | wc -l | tr -d ' ')"
printf 'Rotinas: %s\n' "$(find "$OS_ROOT/rotinas" -maxdepth 1 -type f -name '*.md' ! -name README.md | wc -l | tr -d ' ')"
printf '\nPróximo passo:\n'
sed -n '/^## Próxima ação/,/^## /p' "$OS_ROOT/saidas/RETOMAR.md" | sed '$d' || true

