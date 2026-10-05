#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

fail() {
  echo "ERRO: $1" >&2
  exit 1
}

grep -Fq -- '- onboarding: não iniciado' "$OS_ROOT/memoria.md" \
  || fail "memoria.md indica que o onboarding já começou. Use um template limpo para publicar."

grep -Fq -- '- nome:' "$OS_ROOT/0-eu/perfil.md" \
  || fail "0-eu/perfil.md não está no estado inicial."
grep -Fq -- '- papel atual:' "$OS_ROOT/0-eu/perfil.md" \
  || fail "0-eu/perfil.md não está no estado inicial."
grep -Fq -- 'Atualizado em: —' "$OS_ROOT/0-eu/prioridades.md" \
  || fail "0-eu/prioridades.md parece preenchido."

if find "$OS_ROOT/projetos" -mindepth 1 -type f ! -name README.md -print -quit | grep -q .; then
  fail "há projetos preenchidos no template de distribuição."
fi

if find "$OS_ROOT/_inbox" -mindepth 1 -type f ! -name README.md ! -name .gitkeep -print -quit | grep -q .; then
  fail "há fontes pessoais ou arquivos de trabalho em _inbox/."
fi

if find "$OS_ROOT/saidas/diario" "$OS_ROOT/saidas/rotinas" -mindepth 1 -type f ! -name .gitkeep -print -quit | grep -q .; then
  fail "há saídas geradas no template de distribuição."
fi

if find "$OS_ROOT/skills/os" -mindepth 1 -maxdepth 1 -type d -name modo-publico -print -quit | grep -q .; then
  fail "a skill interna modo-publico não pode entrar no pacote do aluno."
fi

if find "$OS_ROOT/skills/minhas" -mindepth 1 -maxdepth 1 -type d -print -quit 2>/dev/null | grep -q .; then
  fail "há skills de usuário em skills/minhas/ no template de distribuição."
fi

echo "OK: template limpo e sem dados de uma instância real."
