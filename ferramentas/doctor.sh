#!/usr/bin/env bash
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ERRORS=0
WARNINGS=0

ok() { printf 'OK   %s\n' "$1"; }
warn() { printf 'AVISO %s\n' "$1"; WARNINGS=$((WARNINGS + 1)); }
fail() { printf 'ERRO %s\n' "$1"; ERRORS=$((ERRORS + 1)); }

printf 'OS Head de IA — diagnóstico\n'
printf 'Pasta: %s\n\n' "$OS_ROOT"

for file in README.md COMECE-AQUI.md AGENTS.md CLAUDE.md COMANDOS.md memoria.md saidas/RETOMAR.md; do
  if [[ -f "$OS_ROOT/$file" ]]; then
    ok "$file encontrado"
  else
    fail "$file ausente"
  fi
done

PRODUCT_EXPECTED=16
SKILL_COUNT="$(find "$OS_ROOT/skills/os" -mindepth 2 -maxdepth 2 -name SKILL.md -type f 2>/dev/null | wc -l | tr -d ' ')"
if [[ "$SKILL_COUNT" -eq "$PRODUCT_EXPECTED" ]]; then
  ok "$PRODUCT_EXPECTED skills do produto encontradas"
else
  fail "esperava $PRODUCT_EXPECTED skills do produto; encontrei $SKILL_COUNT"
fi

USER_COUNT="$(find "$OS_ROOT/skills/minhas" -mindepth 2 -maxdepth 2 -name SKILL.md -type f 2>/dev/null | wc -l | tr -d ' ')"
ok "$USER_COUNT skill(s) suas em skills/minhas/"

# Monta o conjunto esperado (produto + suas) para comparar com o instalado.
EXPECTED_DIR="$(mktemp -d)"
trap 'rm -rf -- "$EXPECTED_DIR"' EXIT
for skill_dir in "$OS_ROOT"/skills/os/* "$OS_ROOT"/skills/minhas/*; do
  [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
  cp -R "$skill_dir" "$EXPECTED_DIR/$(basename "$skill_dir")"
done
TOTAL_EXPECTED="$(find "$EXPECTED_DIR" -mindepth 2 -maxdepth 2 -name SKILL.md -type f | wc -l | tr -d ' ')"

check_installed_skills() {
  local label="$1"
  local target="$2"
  local count
  count="$(find "$target" -mindepth 2 -maxdepth 2 -name SKILL.md -type f 2>/dev/null | wc -l | tr -d ' ')"
  if [[ "$count" -ne "$TOTAL_EXPECTED" ]]; then
    fail "$label: esperava $TOTAL_EXPECTED skills instaladas; encontrei $count. Rode skills/sync-skills.sh"
    return
  fi
  if diff -qr "$EXPECTED_DIR" "$target" >/dev/null 2>&1; then
    ok "$label: $TOTAL_EXPECTED skills instaladas e sincronizadas"
  else
    fail "$label: skills instaladas estão desatualizadas. Rode skills/sync-skills.sh"
  fi
}

check_installed_skills "Codex" "$OS_ROOT/.agents/skills"
check_installed_skills "Claude Code" "$OS_ROOT/.claude/skills"

if [[ -f "$OS_ROOT/squads/brand-system-builder/workflows/brand-system-pipeline.yaml" ]]; then
  ok "squad Brand System Builder disponível"
else
  fail "squad Brand System Builder ausente"
fi

if command -v git >/dev/null 2>&1; then
  ok "Git disponível: $(git --version)"
else
  warn "Git não encontrado; projetos locais ainda funcionam, mas git clone não"
fi

if command -v codex >/dev/null 2>&1; then
  ok "Codex CLI disponível"
else
  warn "Codex CLI não encontrado no PATH; o Codex Desktop pode continuar funcionando"
fi

if command -v claude >/dev/null 2>&1; then
  ok "Claude Code disponível"
else
  warn "Claude Code não encontrado no PATH; use o Codex ou instale depois"
fi

if [[ -w "$OS_ROOT" ]]; then
  ok "pasta gravável"
else
  fail "pasta sem permissão de escrita"
fi

if find "$OS_ROOT" -type f \( -name '.env' -o -name '*.pem' -o -name '*.key' \) -not -path '*/dist/*' | grep -q .; then
  warn "há arquivo potencialmente sensível; confirme que está ignorado pelo Git"
else
  ok "nenhum arquivo sensível comum detectado"
fi

printf '\nResultado: %s erro(s), %s aviso(s).\n' "$ERRORS" "$WARNINGS"
if [[ "$ERRORS" -gt 0 ]]; then
  exit 1
fi
